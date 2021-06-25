import React from 'react'
import moduleName from './CreateProjectModal.css'
import baseUrl from '../network/network';
export default function CreateProjectModal(props) {
    const {name, price, isModalOpen, closeModal,projectId} = props;
    function keepModalOpen(event){
        event.stopPropagation();
    }
    function onClickYes(){
        fetch(`${baseUrl}/api/v1/deposit-success/${projectId}/`,{
            method:'GET',
            headers:{
                'accept' : 'application/json',
                'content-type' : 'application/json;charset=UTF-8',
                'Authorization' : 'Token ' + sessionStorage.getItem('DODtoken')
            }
        }).then(res => {
            if(res.ok){
                sessionStorage.setItem('getLinkProjectId', projectId);
                window.location.assign('/projectlink');
            }else{
                window.alert('다시 로그인해주세요.')
                window.location.assign('/');
            }
        })
    }
    return (
        <>
            {
                isModalOpen? 
                <div className={'modal'} onClick={closeModal}>
                    <div className='modal-container' onClick={keepModalOpen}>
                        <p className='create-modal-text1'>아래의 정보로 입금하셨나요?</p>
                        <p className='create-modal-text2'>입금자명 : <span className='create-modal-value'>{name}</span></p>
                        <p className='create-modal-text3'>결제금액 : <span className='create-modal-value'>{price}원</span></p>
                        <div className='contour-16margin'/>
                        <div className='create-modal-Btn'>
                            <button className='create-modal-button no' onClick={closeModal}>아니요</button>
                            <button className='create-modal-button yes' onClick={onClickYes}>예</button>
                        </div>
                        
                    </div>
                </div>
                :
                <>
                </>
            }  
        </>
    )
}
