Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D8242DA52
	for <phone-devel@vger.kernel.org>; Fri, 31 Jul 2026 14:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785508764; cv=none; b=u0kNavKW8zN9LUZ50h+l/d45vo2mZqcv/au0zYO3Oo+wZjJWaAYIMGYHI7QZAGibkrWdzzSHtryCXkrkJ2hrZTYeXQRJ0G3vl2TRhPqtU5zWN9kd1rnzHaythmxpORkTWvze3+cEJeTBg9jtASUc/ND23PcOH2B3XFO9d45vICU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785508764; c=relaxed/simple;
	bh=cnQ9TofivQ2bZjfAeMX/42E8H6DyN5sLo6QUxEVqqAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WHQkniwB/vVWHaKHgVWi2Pifxy4I7S7nwICe1KvqlXhUxfcKqUoEKHQ+VX6jaRqD2TFMkP3XTuAM691vbf6RfXx44yaL5KrwB07YidNbvyGHwu6wsJhN2lc3xCmjyf03ZQnL2Q7v1M7wbbov1y4yayz3KRwiAUqZPTzar6mIMiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JYl8zoAv; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JYl8zoAv"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c197eaaab00so169890166b.0
        for <phone-devel@vger.kernel.org>; Fri, 31 Jul 2026 07:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785508761; x=1786113561; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AN1hgiiAoYSEc22S0IPUHYzAb+H+vIEA+bbNrXR6jng=;
        b=JYl8zoAvXM9gf0yons8RI3aMHzgpLyIt61d5EwtQll3Tk3D4ttfC+Ttub+IapHXXwf
         tvq5+RF4O2mCwRovdBjuAnwRgIz2S0zIZLjSMVgn5E1KDqhyjezjSYj1cmHCi3UWcWUv
         VWN9bGou+VoRyY31xtKD/PwZnFeA35MBhWbQs7hRS2PeI+FC04xvPs9wDzBUlyB/hvll
         TH9DwHSrqu17kian6n1yteiFoaKFnD/IXgFoPXketHKwFxPOtf4iqM1SXgjOFMNYTu7D
         HD6LdxpRsliB6DUJL7q6i2RgzmqvY62mRmJNiDvFO8ZgkGGfELagwDllidLu1mMPXQFw
         uU2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785508761; x=1786113561;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AN1hgiiAoYSEc22S0IPUHYzAb+H+vIEA+bbNrXR6jng=;
        b=Gs60+YjyFyaMLz+7bRYnDwNDu0biqoEYtkDcj4uHGDPp4pBrCHYCn8bOEf+wEevZD2
         79kS943aXwsfAsKY7xXzAB5tvFvs2U/ry1PeLbHBpfPgi14U2D7O+AWhYc888tt3c42X
         AvrL0KEHq5GAVIbRdsUgHX5CP4HFcvOrBubta1IKy9sGfth4wEDaWYcx1wPaki64SVsc
         +TKqjPhzqIOBO6w7KF/7YK7+vQUw1Fj8gM5JO1KZcWunIbFecq1m8BotDc6+hlkdZImw
         fJr9RfwpuPPVn+QIfUZ96btLMIOiOcSdJTyCcbngaSKdMqRZPFieJiymMaITjGezxAtg
         BYxg==
X-Forwarded-Encrypted: i=1; AHgh+Rr719BKErPEV9NDvGdaKand8Jj15xrrzYIkQuHWmrAcBMo07m8aS9S5EYa2o8QLEq83os+oxK7fa3wLQw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5oNweNSY6EcdRrFzKJr6b3PuZgmV96ZSH+qRKyFVTxquPYkZo
	BjDUAqgzkdhQZdvbJ7vvQG2NNi6x6+xVelHwr65swxS/I7ZZg0gDYgxW
X-Gm-Gg: AR+sD10nVENVaTX50U/K7/TSm8j8vD+3e6hkdt9qxIQ9JgzEQ6P4QS0I1IUoePN5Tj4
	dZ1eAsaJogKNEIClwL0mz6gb7d2LwxQrO/Gp8E66ZuoR9m9PdqHMEbDQdb58VqKOasFPwi6AUNV
	2LzR7N31QybbKZLAcQvba1EXJIkjPJFTolIpDYMY2xYDsTMP3ZnfjsIDSxQAwFP4wgAtZG9a7gJ
	juyyhubm11TQly5Ptp6cA+kB0YSn38t9WKFT7w6OhfB6ZhGtHQ4ELgyNMsXBRdmwqJ7iiVyPy36
	UL9j9JJ9E/2FHwxSOpzn82eVMe8DulowXXpx/JTJEhxKCk18TPZGqCNop4HRe685muMyhjEJQq8
	uMDs3dpNJjHvuIgKg3RP58kBBdyWH0eOOiad+Qrf39jiBbCJI87hgaC5UNOLjYuhemKMYXe+7ho
	QjbxofKYVXCRQ8xBRhTuXv6f94BIQMLE6LPl+N7cF0FKKqPbC6c8eQZkfhsWGekA==
X-Received: by 2002:a17:906:4784:b0:c16:12ff:dc8b with SMTP id a640c23a62f3a-c1fd26df3c9mr145773966b.54.1785508745515;
        Fri, 31 Jul 2026 07:39:05 -0700 (PDT)
Received: from localhost ([188.65.190.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd3cc3b64sm163629266b.27.2026.07.31.07.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 07:39:05 -0700 (PDT)
Date: Fri, 31 Jul 2026 16:39:01 +0200
From: Richard Acayan <mailingradian@gmail.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: david@ixit.cz, Jeff Johnson <jjohnson@kernel.org>,
	Johannes Berg <johannes.berg@intel.com>,
	Kalle Valo <kvalo@qca.qualcomm.com>,
	Michal Kazior <michal.kazior@tieto.com>,
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH RFC v2] wifi: ath10k: make in-order rx amsdu buffers
 persistent
Message-ID: <amyzhVgSeYO6MptG@rdacayan>
References: <20260719-ath10k-a-msdu-v2-1-f479bb9d1217@ixit.cz>
 <0b9f80bf-73e8-4e9d-9726-b8816c9a364b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0b9f80bf-73e8-4e9d-9726-b8816c9a364b@oss.qualcomm.com>

On Thu, Jul 30, 2026 at 07:24:00PM -0700, Jeff Johnson wrote:
> On 7/19/2026 2:45 PM, David Heidelberg via B4 Relay wrote:
> > From: Richard Acayan <mailingradian@gmail.com>
> > 
> > The WCN3990 might split MSDUs among multiple "in-order" indications. The
> > driver needs information from previous indications to handle MPDUs that
> > are not started by the same indications that complete them. Move the
> > list that tracks unprocessed MSDUs to the driver state so the driver can
> > handle MPDUs that are split in this way and be less confused.
> > 
> > Fixes: c545070e404b ("ath10k: implement rx reorder support")
> > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> > Co-developed-by: David Heidelberg <david@ixit.cz>
> > Signed-off-by: David Heidelberg <david@ixit.cz>
> > ---
> > This one we have in-tree forever.
> 
> I'm transcribing a few comments from my review agent (which may overlap
> Sashiko). I have not vetted them for correctness. Hopefully I placed them at
> the correct spots!
> 
> > 
> > Changes in v2:
> > - checkpatch & style. (Jeff)
> > - Improve comments.
> > - Link to v1: https://lore.kernel.org/linux-wireless/20260210021249.12132-2-mailingradian@gmail.com/
> > ---
> >  drivers/net/wireless/ath/ath10k/htt.h    |  4 +++
> >  drivers/net/wireless/ath/ath10k/htt_rx.c | 50 +++++++++++++++++++++++++-------
> >  2 files changed, 43 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
> > index 25c6b2e2f81c8..07c3dc088f07b 100644
> > --- a/drivers/net/wireless/ath/ath10k/htt.h
> > +++ b/drivers/net/wireless/ath/ath10k/htt.h
> > @@ -1924,16 +1924,20 @@ struct ath10k_htt {
> >  
> >  	bool tx_mem_allocated;
> >  	const struct ath10k_htt_tx_ops *tx_ops;
> >  	const struct ath10k_htt_rx_ops *rx_ops;
> >  	bool disable_tx_comp;
> >  	bool bundle_tx;
> >  	struct sk_buff_head tx_req_head;
> >  	struct sk_buff_head tx_complete_head;
> > +
> > +	u8 rx_in_ord_split_tid;
> > +	u16 rx_in_ord_split_peer_id;
> > +	struct sk_buff_head rx_in_ord_split;
> >  };
> >  
> >  struct ath10k_htt_tx_ops {
> >  	int (*htt_send_rx_ring_cfg)(struct ath10k_htt *htt);
> >  	int (*htt_send_frag_desc_bank_cfg)(struct ath10k_htt *htt);
> >  	int (*htt_alloc_frag_desc)(struct ath10k_htt *htt);
> >  	void (*htt_free_frag_desc)(struct ath10k_htt *htt);
> >  	int (*htt_tx)(struct ath10k_htt *htt, enum ath10k_hw_txrx_mode txmode,
> > diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
> > index ab2d373b4750d..732bd3a2f9992 100644
> > --- a/drivers/net/wireless/ath/ath10k/htt_rx.c
> > +++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
> > @@ -291,16 +291,18 @@ void ath10k_htt_rx_free(struct ath10k_htt *htt)
> >  		return;
> >  
> >  	timer_delete_sync(&htt->rx_ring.refill_retry_timer);
> >  
> >  	skb_queue_purge(&htt->rx_msdus_q);
> >  	skb_queue_purge(&htt->rx_in_ord_compl_q);
> >  	skb_queue_purge(&htt->tx_fetch_ind_q);
> >  
> > +	skb_queue_purge(&htt->rx_in_ord_split);
> > +
> >  	spin_lock_bh(&htt->rx_ring.lock);
> >  	ath10k_htt_rx_ring_free(htt);
> >  	spin_unlock_bh(&htt->rx_ring.lock);
> >  
> >  	dma_free_coherent(htt->ar->dev,
> >  			  ath10k_htt_get_rx_ring_size(htt),
> >  			  ath10k_htt_get_vaddr_ring(htt),
> >  			  htt->rx_ring.base_paddr);
> > @@ -841,16 +843,18 @@ int ath10k_htt_rx_alloc(struct ath10k_htt *htt)
> >  	htt->rx_ring.sw_rd_idx.msdu_payld = 0;
> >  	hash_init(htt->rx_ring.skb_table);
> >  
> >  	skb_queue_head_init(&htt->rx_msdus_q);
> >  	skb_queue_head_init(&htt->rx_in_ord_compl_q);
> >  	skb_queue_head_init(&htt->tx_fetch_ind_q);
> >  	atomic_set(&htt->num_mpdus_ready, 0);
> >  
> > +	skb_queue_head_init(&htt->rx_in_ord_split);
> > +
> >  	ath10k_dbg(ar, ATH10K_DBG_BOOT, "htt rx ring size %d fill_level %d\n",
> >  		   htt->rx_ring.size, htt->rx_ring.fill_level);
> >  	return 0;
> >  
> >  err_dma_idx:
> >  	dma_free_coherent(htt->ar->dev,
> >  			  ath10k_htt_get_rx_ring_size(htt),
> >  			  vaddr_ring,
> > @@ -3156,16 +3160,20 @@ static int ath10k_htt_rx_extract_amsdu(struct ath10k_hw_params *hw,
> >  	struct rx_msdu_end_common *rxd_msdu_end_common;
> >  
> >  	if (skb_queue_empty(list))
> >  		return -ENOBUFS;
> >  
> >  	if (WARN_ON(!skb_queue_empty(amsdu)))
> >  		return -EINVAL;
> >  
> > +	msdu = skb_peek(list);
> > +	rxd = HTT_RX_BUF_TO_RX_DESC(hw,
> > +				    (void *)msdu->data - hw->rx_desc_ops->rx_desc_size);
> 
> Dead rxd computation before the loop — VALID, MINOR
> 
> Lines 3168–3170 compute rxd via skb_peek(), but the while loop at 3172
> immediately dequeues the same SKB and unconditionally recomputes rxd at lines
> 3175–3177. The pre-loop assignment is never read. It's dead code. The original
> patch must have introduced this when restructuring (the pre-existing code
> likely used rxd from before the loop). It should be removed.

This was removed on 20 January 2026 before v1 was submitted. It seems
this v2 is based on applying the commits to the pre-2026 patch.
