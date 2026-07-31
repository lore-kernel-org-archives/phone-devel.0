Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7973101D8
	for <phone-devel@vger.kernel.org>; Fri, 31 Jul 2026 02:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785464649; cv=none; b=i1oDillFGDYvwLFsBE+8cH/7bSASH0AVHdHnnV5Sx3+hSK0ghCGEgmdXr9zqQ3okqVF78zekZkuwmyI5/aM7IMGUuVOW35MccXC1v0yaYG7rADSJQDDx9utpodcclAK6lYPtoys44iyYth+lHv8aTON2G2gSpnt3i+4RfmYMZ1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785464649; c=relaxed/simple;
	bh=fMbVQDHd0E34Q9EFoNIhweZeXg7ARlyrUDMDULe2zug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z6sSDALbgxPYVeJ2g22ElqDBgoJWohy5CN5I6nF9RwtbsEm1XIy5F+uwwiBMKBcbRmh0nXFXFSK0zRo8biKGIusyBjkdUcNv8GRVkUA63Gxbud4wom/EKMqp/J/Sd59okMiYlDuxoQL9uxAoc+x9hoT2jVEsatWgxffiqRrZBfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HPOOOKTU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Di1Mt9MG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HPOOOKTU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Di1Mt9MG"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V2I13I3819706
	for <phone-devel@vger.kernel.org>; Fri, 31 Jul 2026 02:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZQoI3G7BPgfzmJi/xWF6ywnQxpARjLNuk85Wk6DNVbw=; b=HPOOOKTUiEvSajhz
	QPOLI8zorirKYsJCA7bSgGwtPhyLUzG7y/dFQgSy8KZRHeiG/dWQENRKR/M2Y3Vj
	kO0Jx43n6jAHHHfsdzcQgjX86Iw69f/YkRB2ndeVbi0l69A2fWC2ELDcT2OI5MhZ
	WKMJRlyzOeDxN7kiLSNAtNIJXY64JMoBAv1V06Z6gGT4IkxiLIzgn6mXgOSCjUw+
	wGhdrIPN5vf4emTuDImRj0fcBgzCpQv9sXmeMKfFG6Em8xq0OxghJXgKIJIGNDi6
	va0/aYuTHrecCbDpDA7yFHaeaaTPWuRGYvMLxePUeIufx+0X0IZ9eOE1ujangbYz
	8KmsKg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frjt380kw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 31 Jul 2026 02:24:06 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88cfe287e1so379998a12.1
        for <phone-devel@vger.kernel.org>; Thu, 30 Jul 2026 19:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785464646; x=1786069446; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZQoI3G7BPgfzmJi/xWF6ywnQxpARjLNuk85Wk6DNVbw=;
        b=Di1Mt9MGAsr6Cd1ccl40YMs20pHpmFXvTcZ2NxU7xSOGTfhkcavDaF8o1b8PRa1wKe
         SLHvFOpVlDZTaqPiZUrmK7FixqudF5nVe0+31XyLcif3W62EDkweneu4WfhCv/ETn9NT
         wLfPve3adZ3iKHfzUTVo5xoLOEKPU3Dc1YeR6WVAfn0b5weBrmW68h9innACJKE2YflE
         xLIQN9rDtkcRf8DPCH/wMx4YGQdoRY5tQgEZbwTHdN4uFUtQPGYWjFgWJn8Ok25EAqaE
         729upuZ351PMvDaAe5T4z2UDuTYgGioSoKkYvZf/bnDwqm0xsa/aZjNzLq6oHyh9PQA/
         CGSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785464646; x=1786069446;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZQoI3G7BPgfzmJi/xWF6ywnQxpARjLNuk85Wk6DNVbw=;
        b=axeVNvnuL4WIKlmERj/kPE8HWLLWuCTL90tq3tAya+gsf15EqDp96c7s3geyiWXxWG
         wJRCKwuH2oKrzyZu4Kt/OHtNDWAy/wkg7Mnp4Vxk9IGDtOavMuU3cjAAiHEYbJpNf8dD
         sGJ4BBkLeVzLdqiNKtxzwt0AuFDr+ESEz0wxBMRxyA19Mp+2+eWjUy7fnRogbnJYUWph
         /beLVq+hzZng/mD1CLrjmIYydVSOYEt+Un2Ppm6+Di1I+Z0EIVJLXqAfEfQOQXyNOuUW
         PkClIdFJP5hIacHBzFsDjHmh8VRTn60n9hb0Wk/0ulqqjL25XhirBk1P0xGNi79kJkV/
         GJhA==
X-Forwarded-Encrypted: i=1; AHgh+RprcAfzFqxczLH2nbXACpe7Tf3BmbKDYQxYkoohR2MtFe2lKKU3ouAQeRyx+HdTVpyUvLxLz9lTTqCH9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFWv4MqiQaxfMrL5CVbMF5yShKt7pG+GB81c8NszUJXQDlp2hi
	3Bq+FRhbrPbnYuo8erZK50s98I+8g1eR3jrEgVIQN9U8br4wmtd1jXBESxdkR6fAXnicTzXH3Hl
	sx0515RiIaVQA7cXHrNVyZMF2Sf1dBmzA7XLni1dZU5yoraDK3XWUl5dBrQfmeco/xg==
X-Gm-Gg: AR+sD10k4dQifsWwh0434mvPqygcjnH3RLJjS2LehriSaqrrJUPN5eZej+l3l6revTz
	K59eVaoXy5H7ajAVZSGYOn8hFw50wzsrhzu6jed4s6E8Pz+Xw1OuZ571/r4YVRw9y8o7YzMOZyE
	w7kL+iss7RmlK0oYcsiXLv+UhRFn0WzRrnvoh8azxhydzJv+yNJ7HyqH3VTSiqq3FVwozG56f14
	ZSYSRqRLFdvbFh6Ep00KZM62o0HYYQvt8OpriPYjczhV0nB7rjgm7B6qqTYXJNQkKoneQGeOzmd
	R2QiLqH2aSYwW1dofi/ImLL/Q+Qpe/z0alXTt7sNdzAEQN7jhEB+As9QRNVWdX9izngmxsFa8Al
	cIZtoQxbw82qBm45wsIqZ/zFa3aT9pLr/dMVTEAfmXvPwwmTZEwiR3eUgVPM=
X-Received: by 2002:a05:6a20:548c:b0:3c3:954d:279a with SMTP id adf61e73a8af0-3c91b1f34c5mr45042637.33.1785464645766;
        Thu, 30 Jul 2026 19:24:05 -0700 (PDT)
X-Received: by 2002:a05:6a20:548c:b0:3c3:954d:279a with SMTP id adf61e73a8af0-3c91b1f34c5mr45011637.33.1785464645243;
        Thu, 30 Jul 2026 19:24:05 -0700 (PDT)
Received: from [192.168.1.9] (103.sub-97-215-187.myvzw.com. [97.215.187.103])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153aee6790sm595372eec.28.2026.07.30.19.24.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 19:24:04 -0700 (PDT)
Message-ID: <0b9f80bf-73e8-4e9d-9726-b8816c9a364b@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 19:24:00 -0700
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2] wifi: ath10k: make in-order rx amsdu buffers
 persistent
To: david@ixit.cz, Jeff Johnson <jjohnson@kernel.org>,
        Johannes Berg <johannes.berg@intel.com>,
        Kalle Valo
 <kvalo@qca.qualcomm.com>,
        Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, Richard Acayan <mailingradian@gmail.com>
References: <20260719-ath10k-a-msdu-v2-1-f479bb9d1217@ixit.cz>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260719-ath10k-a-msdu-v2-1-f479bb9d1217@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAxMiBTYWx0ZWRfX+b9JWArZg5Vm
 Qh8AiQdJj/Dqpr9XqK4UhTjNlv/3Vh4g264sIhmwZGIlQ/LHpziItjbPL9YfMzP/mD0XBnA21Ug
 rFy027r8YSyfp1SrYx5QXvdZZp1xWN8=
X-Proofpoint-GUID: FqhwgtRYII2GeNMdxP40Qp_Q-cwPWp2E
X-Authority-Analysis: v=2.4 cv=PeDPQChd c=1 sm=1 tr=0 ts=6a6c0746 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=UaEkX0D7FlC0tWE/LoNF7Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=7m40zdTuHQOX8Ya2pEUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAxMiBTYWx0ZWRfX5pE8KngIlwfL
 nak993CgyfqiMTGD1qhu+1kFd39QUa5zRb41nb+6PeSkFCl48eBOjT6dmL6zt7n2a7kso9ykdBb
 1M9SDJ+T9RlXozhthU0faCdMPxc2TOyuSocGd9jWtDBc9fnDm8Y0BJJULunDpyFqtPd4Y8tCHNb
 YRN2yqpot1fg6YE8kRq5BFJy6kOFhlhkVW2wWRHSGCZkiHINBookcPrOrFP5uNcQc6G+EBsh8JF
 0KfHOIQp9wIAOBtDrfUctwwKXiHQYtTptYxWHWhbZlSzhuVcf+uac4bdfK9hGzGa3mldXciTTkI
 EOMIIK8U1iGAflDVBRwn6DQaWf1QTd9l/I5iO51RaHWQr9nVlvYfMn+i2O+nG/Hdxt4Dt2n22Ut
 wBFGozu1rxco+6kwJwwanmRqFfd14TYkzXmJ9MVdmLSmWl3aXypvoEMcwCO+LUhPyw0R0YyLKJ4
 /WJNy+fUqU8IlQ3s3Zw==
X-Proofpoint-ORIG-GUID: FqhwgtRYII2GeNMdxP40Qp_Q-cwPWp2E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 priorityscore=1501 adultscore=0 bulkscore=0
 suspectscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310012

On 7/19/2026 2:45 PM, David Heidelberg via B4 Relay wrote:
> From: Richard Acayan <mailingradian@gmail.com>
> 
> The WCN3990 might split MSDUs among multiple "in-order" indications. The
> driver needs information from previous indications to handle MPDUs that
> are not started by the same indications that complete them. Move the
> list that tracks unprocessed MSDUs to the driver state so the driver can
> handle MPDUs that are split in this way and be less confused.
> 
> Fixes: c545070e404b ("ath10k: implement rx reorder support")
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> This one we have in-tree forever.

I'm transcribing a few comments from my review agent (which may overlap
Sashiko). I have not vetted them for correctness. Hopefully I placed them at
the correct spots!

> 
> Changes in v2:
> - checkpatch & style. (Jeff)
> - Improve comments.
> - Link to v1: https://lore.kernel.org/linux-wireless/20260210021249.12132-2-mailingradian@gmail.com/
> ---
>  drivers/net/wireless/ath/ath10k/htt.h    |  4 +++
>  drivers/net/wireless/ath/ath10k/htt_rx.c | 50 +++++++++++++++++++++++++-------
>  2 files changed, 43 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
> index 25c6b2e2f81c8..07c3dc088f07b 100644
> --- a/drivers/net/wireless/ath/ath10k/htt.h
> +++ b/drivers/net/wireless/ath/ath10k/htt.h
> @@ -1924,16 +1924,20 @@ struct ath10k_htt {
>  
>  	bool tx_mem_allocated;
>  	const struct ath10k_htt_tx_ops *tx_ops;
>  	const struct ath10k_htt_rx_ops *rx_ops;
>  	bool disable_tx_comp;
>  	bool bundle_tx;
>  	struct sk_buff_head tx_req_head;
>  	struct sk_buff_head tx_complete_head;
> +
> +	u8 rx_in_ord_split_tid;
> +	u16 rx_in_ord_split_peer_id;
> +	struct sk_buff_head rx_in_ord_split;
>  };
>  
>  struct ath10k_htt_tx_ops {
>  	int (*htt_send_rx_ring_cfg)(struct ath10k_htt *htt);
>  	int (*htt_send_frag_desc_bank_cfg)(struct ath10k_htt *htt);
>  	int (*htt_alloc_frag_desc)(struct ath10k_htt *htt);
>  	void (*htt_free_frag_desc)(struct ath10k_htt *htt);
>  	int (*htt_tx)(struct ath10k_htt *htt, enum ath10k_hw_txrx_mode txmode,
> diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
> index ab2d373b4750d..732bd3a2f9992 100644
> --- a/drivers/net/wireless/ath/ath10k/htt_rx.c
> +++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
> @@ -291,16 +291,18 @@ void ath10k_htt_rx_free(struct ath10k_htt *htt)
>  		return;
>  
>  	timer_delete_sync(&htt->rx_ring.refill_retry_timer);
>  
>  	skb_queue_purge(&htt->rx_msdus_q);
>  	skb_queue_purge(&htt->rx_in_ord_compl_q);
>  	skb_queue_purge(&htt->tx_fetch_ind_q);
>  
> +	skb_queue_purge(&htt->rx_in_ord_split);
> +
>  	spin_lock_bh(&htt->rx_ring.lock);
>  	ath10k_htt_rx_ring_free(htt);
>  	spin_unlock_bh(&htt->rx_ring.lock);
>  
>  	dma_free_coherent(htt->ar->dev,
>  			  ath10k_htt_get_rx_ring_size(htt),
>  			  ath10k_htt_get_vaddr_ring(htt),
>  			  htt->rx_ring.base_paddr);
> @@ -841,16 +843,18 @@ int ath10k_htt_rx_alloc(struct ath10k_htt *htt)
>  	htt->rx_ring.sw_rd_idx.msdu_payld = 0;
>  	hash_init(htt->rx_ring.skb_table);
>  
>  	skb_queue_head_init(&htt->rx_msdus_q);
>  	skb_queue_head_init(&htt->rx_in_ord_compl_q);
>  	skb_queue_head_init(&htt->tx_fetch_ind_q);
>  	atomic_set(&htt->num_mpdus_ready, 0);
>  
> +	skb_queue_head_init(&htt->rx_in_ord_split);
> +
>  	ath10k_dbg(ar, ATH10K_DBG_BOOT, "htt rx ring size %d fill_level %d\n",
>  		   htt->rx_ring.size, htt->rx_ring.fill_level);
>  	return 0;
>  
>  err_dma_idx:
>  	dma_free_coherent(htt->ar->dev,
>  			  ath10k_htt_get_rx_ring_size(htt),
>  			  vaddr_ring,
> @@ -3156,16 +3160,20 @@ static int ath10k_htt_rx_extract_amsdu(struct ath10k_hw_params *hw,
>  	struct rx_msdu_end_common *rxd_msdu_end_common;
>  
>  	if (skb_queue_empty(list))
>  		return -ENOBUFS;
>  
>  	if (WARN_ON(!skb_queue_empty(amsdu)))
>  		return -EINVAL;
>  
> +	msdu = skb_peek(list);
> +	rxd = HTT_RX_BUF_TO_RX_DESC(hw,
> +				    (void *)msdu->data - hw->rx_desc_ops->rx_desc_size);

Dead rxd computation before the loop — VALID, MINOR

Lines 3168–3170 compute rxd via skb_peek(), but the while loop at 3172
immediately dequeues the same SKB and unconditionally recomputes rxd at lines
3175–3177. The pre-loop assignment is never read. It's dead code. The original
patch must have introduced this when restructuring (the pre-existing code
likely used rxd from before the loop). It should be removed.

> +
>  	while ((msdu = __skb_dequeue(list))) {
>  		__skb_queue_tail(amsdu, msdu);
>  
>  		rxd = HTT_RX_BUF_TO_RX_DESC(hw,
>  					    (void *)msdu->data -
>  					    hw->rx_desc_ops->rx_desc_size);
>  
>  		rxd_msdu_end_common = ath10k_htt_rx_desc_get_msdu_end(hw, rxd);
> @@ -3257,17 +3265,16 @@ static void ath10k_htt_rx_h_rx_offload(struct ath10k *ar,
>  	}
>  }
>  
>  static int ath10k_htt_rx_in_ord_ind(struct ath10k *ar, struct sk_buff *skb)
>  {
>  	struct ath10k_htt *htt = &ar->htt;
>  	struct htt_resp *resp = (void *)skb->data;
>  	struct ieee80211_rx_status *status = &htt->rx_status;
> -	struct sk_buff_head list;
>  	struct sk_buff_head amsdu;
>  	u16 peer_id;
>  	u16 msdu_count;
>  	u8 vdev_id;
>  	u8 tid;
>  	bool offload;
>  	bool frag;
>  	int ret;
> @@ -3292,64 +3299,85 @@ static int ath10k_htt_rx_in_ord_ind(struct ath10k *ar, struct sk_buff *skb)
>  		   "htt rx in ord vdev %i peer %i tid %i offload %i frag %i msdu count %i\n",
>  		   vdev_id, peer_id, tid, offload, frag, msdu_count);
>  
>  	if (skb->len < msdu_count * sizeof(*resp->rx_in_ord_ind.msdu_descs32)) {
>  		ath10k_warn(ar, "dropping invalid in order rx indication\n");
>  		return -EINVAL;
>  	}
>  
> -	/* The event can deliver more than 1 A-MSDU. Each A-MSDU is later
> -	 * extracted and processed.
> +	if (!skb_queue_empty(&htt->rx_in_ord_split)) {
> +		/*
> +		 * It might still be possible to handle this case if there is
> +		 * only one peer that splits at each given moment. We are
> +		 * bailing out because we should have a test case for this
> +		 * before trying to fix it.
> +		 */
> +		if (tid != htt->rx_in_ord_split_tid ||
> +		    peer_id != htt->rx_in_ord_split_peer_id ||
> +		    offload) {

Dead offload disjunct — VALID, MINOR

ath10k_htt_rx_h_rx_offload() at line 3346 drains rx_in_ord_split entirely (via
__skb_dequeue loop). After it runs, the while (!skb_queue_empty(...)) loop at
3348 never executes. Therefore a split (-EAGAIN from
ath10k_htt_rx_extract_amsdu) can never occur for offload frames. The ||
offload condition at line 3316 in the split-validation guard is unreachable.
It should be removed for clarity.


> +			ath10k_warn(ar, "split amsdu did not resume immediately\n");
> +			htt->rx_confused = true;
> +			ath10k_core_start_recovery(ar);
> +			return -EIO;
> +		}
> +	}
> +
> +	/*
> +	 * The event can deliver more than 1 A-MSDU or continue a previous one.
> +	 * Each A-MSDU is later extracted and processed.
>  	 */
> -	__skb_queue_head_init(&list);
>  	if (ar->hw_params.target_64bit)
>  		ret = ath10k_htt_rx_pop_paddr64_list(htt, &resp->rx_in_ord_ind,
> -						     &list);
> +						     &htt->rx_in_ord_split);
>  	else
>  		ret = ath10k_htt_rx_pop_paddr32_list(htt, &resp->rx_in_ord_ind,
> -						     &list);
> +						     &htt->rx_in_ord_split);
>  
>  	if (ret < 0) {
>  		ath10k_warn(ar, "failed to pop paddr list: %d\n", ret);
>  		htt->rx_confused = true;
>  		ath10k_core_start_recovery(ar);
>  		return -EIO;

rx_in_ord_split not purged on pop_paddr error — VALID BUG

Lines 3335–3339: on pop_paddr error, htt->rx_confused = true and
ath10k_core_start_recovery() are called, but
__skb_queue_purge(&htt->rx_in_ord_split) is missing. If a split is already in
progress (queue is non-empty) when pop_paddr fails on the continuation event,
the existing SKBs are stranded. The default: path at lines 3371–3377 does
purge the queue, making this an inconsistency. This will leak DMA-mapped SKBs.

>  	}
>  
>  	/* Offloaded frames are very different and need to be handled
>  	 * separately.
>  	 */
>  	if (offload)
> -		ath10k_htt_rx_h_rx_offload(ar, &list);
> +		ath10k_htt_rx_h_rx_offload(ar, &htt->rx_in_ord_split);
>  
> -	while (!skb_queue_empty(&list)) {
> +	while (!skb_queue_empty(&htt->rx_in_ord_split)) {
>  		__skb_queue_head_init(&amsdu);
> -		ret = ath10k_htt_rx_extract_amsdu(&ar->hw_params, &list, &amsdu);
> +		ret = ath10k_htt_rx_extract_amsdu(&ar->hw_params,
> +						  &htt->rx_in_ord_split, &amsdu);
>  		switch (ret) {
>  		case 0:
>  			/* Note: The in-order indication may report interleaved
>  			 * frames from different PPDUs meaning reported rx rate
>  			 * to mac80211 isn't accurate/reliable. It's still
>  			 * better to report something than nothing though. This
>  			 * should still give an idea about rx rate to the user.
>  			 */
>  			ath10k_htt_rx_h_ppdu(ar, &amsdu, status, vdev_id);
>  			ath10k_htt_rx_h_filter(ar, &amsdu, status, NULL);
>  			ath10k_htt_rx_h_mpdu(ar, &amsdu, status, false, NULL,
>  					     NULL, peer_id, frag);
>  			ath10k_htt_rx_h_enqueue(ar, &amsdu, status);
>  			break;
>  		case -EAGAIN:
> -			fallthrough;
> +			htt->rx_in_ord_split_tid = tid;
> +			htt->rx_in_ord_split_peer_id = peer_id;
> +
> +			return -EIO;

frag flag not saved across -EAGAIN — VALID BUG

frag is a local extracted from the current event's header (line 3296). On
-EAGAIN (line 3366–3370), only tid and peer_id are saved. When the
continuation event arrives, ath10k_htt_rx_h_mpdu() at line 3362 is called with
the frag from the new event, not the original split event. If the original
said frag=1, the fragments will be misprocessed by mac80211 on continuation.
This needs rx_in_ord_split_frag added alongside _tid and _peer_id.

>  		default:
>  			/* Should not happen. */
>  			ath10k_warn(ar, "failed to extract amsdu: %d\n", ret);
>  			htt->rx_confused = true;
> -			__skb_queue_purge(&list);
> +			__skb_queue_purge(&htt->rx_in_ord_split);
>  			ath10k_core_start_recovery(ar);
>  			return -EIO;
>  		}
>  	}
>  	return ret;
>  }
>  
>  static void ath10k_htt_rx_tx_fetch_resp_id_confirm(struct ath10k *ar,
> 
> ---
> base-commit: 0718283ab28bc3907e10b61a6b4be6fefa1cbb2f
> change-id: 20260719-ath10k-a-msdu-c49334eb091d
> 
> Best regards,

