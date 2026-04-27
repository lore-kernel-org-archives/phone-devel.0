Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403DE3B6365
	for <phone-devel@vger.kernel.org>; Mon, 27 Apr 2026 12:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777291573; cv=none; b=d1yvQv87BlWBEy8K0Kyssah2aOSFHWviMMTAXiqsNbUH8RhOPGixFSwFWdEWmuR3UibGAT3ij/8CeqgDyw8GBUyFLH7/5coW76TS8LDBbCF+IKZz0jJXLeSM39u8N8PZJ17tJeLFy32Yyec6R5xmUz+KTIAIyIzLrBNtcQskoB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777291573; c=relaxed/simple;
	bh=F6MsY6q4bSeme9jrlCkMC7+dXwQzMH5QgSd0FEaplVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UGVacJ2i82OWp+5EQyOMdPrIO0GRycFQOeMldpl7dVuJ/Ep78fBXxQa+DXLs0asQyYr8QbPI8XikWVVZBdNIg1NChxfy0mQiXExKP0MzYOu8qhxnuLQ8dAh/IIvaYLi/ih1RIEAGETGG2II5ktCjdMS4hfYJCls9dKdBb4yWWLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AM7uF6/V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V325ap2Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AM7uF6/V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V325ap2Q"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TBn62793121
	for <phone-devel@vger.kernel.org>; Mon, 27 Apr 2026 12:06:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TsESwDIwA8Eq86xNAI5r6tmdBS46YOMoxxD+xO9ArOU=; b=AM7uF6/V6eslYfVE
	Zkep01HRb86Ernt5r8jwNmosJ6H6oNeDk6SPF5SLidbxQP1pWXQblU+PMV/JMHTN
	ZwQTDRySJ7+TWzd+RyS745BSl5isj27ifZYpAaEq3Lvw/5jAK6MLNGjOCtSlSi0K
	3wiD0nEQVcVHD/pSA+AYH4YtzRcAzqWCsy15OqjkJsedehViNyE8+TMw7AVx1HgT
	mYpDoNfKKZBeI1t8UHv9iButu1sKucLJNSHjdkjAk0Xm7/xcAEg3OqcSGC/hcHUV
	balKGGQ+dUIW66KfqOtBJNBGK0QVY4NiVnM/rAgledVe052TBMJdlO2zvuGbXvA9
	/K6deg==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dsa4uv2kx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 27 Apr 2026 12:06:08 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7dc41904354so21075917a34.0
        for <phone-devel@vger.kernel.org>; Mon, 27 Apr 2026 05:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777291568; x=1777896368; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TsESwDIwA8Eq86xNAI5r6tmdBS46YOMoxxD+xO9ArOU=;
        b=V325ap2QHdHt8DOfagjGBgjOs6YvisqITJk8XVr+jq/gkZUWIoywl15jNHUMR3KKc0
         n+qUWFkX+iNcSssUpswUSnwQqaOgbDjUb1y0KXgda6llQG6ZcokztebOktp9kQbdanXp
         Z162Mu4ldpY6LfIDf8eswgdqpc+RMzfcDhFj6KEtW3r/M7nX9bKhDuUECF2EJ2hNlIwE
         BuBPbq6OC9gD38Pi+1Kfu8NtrPU/xdDI84BZGW0z+gguDmgf57SWLp6PGNu74R9NY9bF
         PWg49PpTXx5TJPOurhoNUD0yNlHf6BAKW4Vv59Iz/qXh4Wvc2k9J84224onHtk0XKw+E
         lVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777291568; x=1777896368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TsESwDIwA8Eq86xNAI5r6tmdBS46YOMoxxD+xO9ArOU=;
        b=CN8q083wTvEQ0eECgCVzy67+bAWZJ6tmqFx5mcluBztDlT1UzaPIrdM1+5EIYPGhqk
         LoPZDb5oql+ryE5Q6/NOsANZTPv2D/3BSwiX+dVkZ3K0866qmqmLydBZlpXwU75UHd8Z
         30MDoyLU2mg6yFZPJg1YyP/P+0akvoOa94cIFnP4B20KYc13HftUc6FvRAcAc+36NmZ2
         sgU16tRSW0AoVUt9oahmDUNs8LVufJ6CwZooNusdEC8OZmZ6DTRBr77SCy1QkeC7vQqx
         6+06FrX9RxkOJoZHNjEJaG+iBah9hzsId8KWxMCnT8f1GnKokMu6Qwg/521HmZX3T4JD
         2/vg==
X-Forwarded-Encrypted: i=1; AFNElJ+4hLDnOkrRWU3yhRJOfrj2IxDKLazUlYGWisoXG1o6IW2vEWLH4pk9NMBLzsFul1IGWLl3A41oz6ssVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YycDvZfOu8RhplPaeb2RM/ZUuvMfkJl+mAhBWwYd1CKL+lT0wbs
	q6X6t1ZovGE/AcD9akQ7nGIQtU1THpq8sDgDniVbPi2Xl19F+9so1YXPK6LMCtOSHt7WQdcyE3V
	FQwxYHOBNFxy/QyZGYk43/npKE4VY4VEvkCMUOObkBpOKCJZlsbalo97Kkn99hGLpicDE2gBy4g
	==
X-Gm-Gg: AeBDiesmSMLv0p/MGZYRvWmtODUu6t2WBJQOTtOEJ/irpNyqzLXChqQRMoX7GVx54ng
	OvgJkAXkYaHUetiDnUFrX81up4IkXcish7meG/Ev7J/uR/9WyzvxjWXNCQx/QhuOKnv6O3syQtK
	MTmD6lWTgK1TVmx/23ZXvhCWSucsqWp4q7CKuIcaxrlXO9wTN/vTwt53P97s5rQ37jHeK1aqlAb
	BMK4eBuKCuI90DC6F0UAbViTMpSqFJZ0MAY4qlZdyTXBlk/rdRugk6J5AUpjuKHUsquWOWr69md
	zt8em60YN7Ei/zkV+IrkdP6TqNsI9c6vnMYqoQh6X7VlQbloVU5g+kWmcVqwZ6WP+MNlrOohRix
	3TzzjReCQzGmKi7isl/8J2V1HEalVWT8EPizeFowyUnfgGrsu7N34oEhPOmU=
X-Received: by 2002:a05:6820:1627:b0:696:4874:2dcf with SMTP id 006d021491bc7-696487430cemr2020536eaf.23.1777291567977;
        Mon, 27 Apr 2026 05:06:07 -0700 (PDT)
X-Received: by 2002:a05:6820:1627:b0:696:4874:2dcf with SMTP id 006d021491bc7-696487430cemr2020512eaf.23.1777291567329;
        Mon, 27 Apr 2026 05:06:07 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-43fe4cb11b4sm81262966f8f.2.2026.04.27.05.06.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 05:06:06 -0700 (PDT)
Message-ID: <47f72fe9-886b-4837-9612-2b2d3e5b5da5@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:06:05 +0000
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] ASoC: qcom: qdsp6: q6afe: fix clk vote response type
 mismatch
To: Val Packett <val@packett.cool>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Bhushan Shah <bhushan.shah@machinesoul.in>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Antoine Bernard <zalnir@proton.me>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260423050801.210840-2-val@packett.cool>
 <20260423050801.210840-3-val@packett.cool>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260423050801.210840-3-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9yKtLGM5XM8WNajEM2nBLC7wAUzeEz3W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEyOSBTYWx0ZWRfXxvPUbPED/mZG
 bzcCRvLMw/RfOIzGu/8F9DhwZYdPYt+oyF2B4f8EumNGtLOG9N06OVnk3kY++mQl4xhn2L4X624
 gYWJ484n5Ql3n4jKzvFH5MaRAfyKIhlr3cvvrtp0+ZXeXd0goQ6T3cdoFVqswt+uDTt4cSQiYgI
 wogoP1bPeHvKkFzeCoNlrTkLrVWaxRjM3+YJW/vXUkDYLxRpGk0i7g1sWdnGo/ssaKfTh6M7nwU
 UEjD6UmjufRM2kx555KBaM8jLtuo8aPSJ63AdxmP9dLoAp3Md+4ubhU9C99l458lN0A4XSMtxWu
 +dW/zWXv9J5WsQ65vxzWrnih7mjRnmMAejxZXxMRoUtf9BzS8bwUrixCjfl3ZfTTgS9AX3sLFvO
 9CpkaIvrI70zhdUPE1pBc/Q+sGTsEeNIjYafsNW+8Skf9eyWqS41RLSUd8CKR3o/z6gOvp1Mhvl
 XG+5yG76sE2C9aYrchQ==
X-Proofpoint-ORIG-GUID: 9yKtLGM5XM8WNajEM2nBLC7wAUzeEz3W
X-Authority-Analysis: v=2.4 cv=J/GaKgnS c=1 sm=1 tr=0 ts=69ef5130 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=VIjOQ41OAAAA:20 a=EUspDBNiAAAA:8 a=L06xKFqT_MmC7owT6poA:9
 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270129



On 4/23/26 4:41 AM, Val Packett wrote:
> The response sent by the firmware when requesting a clock vote (opcode
> AFE_CMD_RSP_REMOTE_LPASS_CORE_HW_VOTE_REQUEST) does not actually have
> the same opcode + status payload as APR_BASIC_RSP_RESULT. Rather, it
> returns one single u32 which is the client_handle that must be used in
> future unvote requests for the same clock.
> 
> As a result of this type confusion, the status returned by the callback
> to q6afe_vote_lpass_core_hw was actually an out-of-bounds read. It was
> only interpreted as success (0) most of the time due to luck, but there
> are reports of random ("more likely on cold boot", "depending on hacks
> made in other drivers") errors such as:
> 
> [   20.961100] qcom-q6afe aprsvc:service:4:4: AFE failed to vote (3)
> [   20.961131] Failed to prepare clk 'core': -110
> 
> Fix by correctly interpreting the response as a single u32, and actually
> store it as the client_handle to ensure unvote would work correctly.
> 
> Link: https://lore.kernel.org/all/5976946.DvuYhMxLoT@antlia/
> Signed-off-by: Val Packett <val@packett.cool>

Fixes and Stable tag is missing.


otherwise lgtm.


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
> ---
> 
> Found by reading and comparing with downstream:
> https://github.com/YumeMichi/kernel_xiaomi_pipa/blob/27190355fb31284988ddf505cb7cfba5128104cf/techpack/audio/dsp/q6afe.c#L1261-L1263
> 
> What's really bizzare though is that some of the logs go:
> 
> [ 10.827469] qcom-q6afe aprsvc:service:4:4: cmd = 0x100f4 returned error 
> = 0x16
> [ 10.827512] qcom-q6afe aprsvc:service:4:4: Unknown cmd 0x100f4
> [ 14.052896] qcom-q6afe aprsvc:service:4:4: AFE failed to vote (3)
> 
> ..where the "returned error =" message is something that can only be
> printed by the callback if it goes into the **other** switch() branch,
> i.e. when hdr->opcode == APR_BASIC_RSP_RESULT. How reading out-of-bounds
> only in the AFE_CMD_RSP_REMOTE_LPASS_CORE_HW_VOTE_REQUEST branch would
> cause that to happen (even on a subsequent vote after the first one to
> perform the read) is beyond me.
> 
> Still, the person that reported this heisenbug told me that this has
> actually completely fixed it.
> 
> ---
>  sound/soc/qcom/qdsp6/q6afe.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
> index 40237267fda0..28b5b6b91897 100644
> --- a/sound/soc/qcom/qdsp6/q6afe.c
> +++ b/sound/soc/qcom/qdsp6/q6afe.c
> @@ -379,6 +379,7 @@ struct q6afe {
>  	struct q6core_svc_api_info ainfo;
>  	struct mutex lock;
>  	struct aprv2_ibasic_rsp_result_t result;
> +	uint32_t vote_result;
>  	wait_queue_head_t wait;
>  	struct list_head port_list;
>  	spinlock_t port_list_lock;
> @@ -968,13 +969,14 @@ static int q6afe_callback(struct apr_device *adev, const struct apr_resp_pkt *da
>  	const struct aprv2_ibasic_rsp_result_t *res;
>  	const struct apr_hdr *hdr = &data->hdr;
>  	struct q6afe_port *port;
> +	uint32_t *vote_res;
>  
>  	if (!data->payload_size)
>  		return 0;
>  
> -	res = data->payload;
>  	switch (hdr->opcode) {
>  	case APR_BASIC_RSP_RESULT: {
> +		res = data->payload;
>  		if (res->status) {
>  			dev_err(afe->dev, "cmd = 0x%x returned error = 0x%x\n",
>  				res->opcode, res->status);
> @@ -1001,8 +1003,10 @@ static int q6afe_callback(struct apr_device *adev, const struct apr_resp_pkt *da
>  	}
>  		break;
>  	case AFE_CMD_RSP_REMOTE_LPASS_CORE_HW_VOTE_REQUEST:
> +		vote_res = data->payload;
>  		afe->result.opcode = hdr->opcode;
> -		afe->result.status = res->status;
> +		afe->result.status = 0;
> +		afe->vote_result = *vote_res;
>  		wake_up(&afe->wait);
>  		break;
>  	default:
> @@ -1899,6 +1903,8 @@ int q6afe_vote_lpass_core_hw(struct device *dev, uint32_t hw_block_id,
>  			       AFE_CMD_RSP_REMOTE_LPASS_CORE_HW_VOTE_REQUEST);
>  	if (ret)
>  		dev_err(afe->dev, "AFE failed to vote (%d)\n", hw_block_id);
> +	else
> +		*client_handle = afe->vote_result;
>  
>  	return ret;
>  }

