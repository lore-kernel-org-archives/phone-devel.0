Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E801EF39E
	for <phone-devel@vger.kernel.org>; Mon, 13 Jul 2026 10:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939666; cv=none; b=QOSirC9d1gGe20tEPX7h0njotpEaVjp9CSXM9yXB2LUydEG8G8Pk70hN5b+CUbP6qpyZZYMT+AKWhb0MvF5nsDK8liH5ATXkseq+XT6bJZX4UcTTXSW1J/QZtOB5B+HOflU6DdzncyAhpHiZTGRffibDOgL+chy5+WTL7lNpjhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939666; c=relaxed/simple;
	bh=LHA0MGvnSeQbYiIUyIqWKF5b83gNqvEEHY2/ulyJYNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sdFqcJSRWEJc/Aw4FJvrUXhnPkTleUFL+0xnJ3ANqxYYTZd5ugyXYuAONbwVN2twQZx0wS4nYnd8cArRhCjK1OA3yCFTwoIFXUDK6qMDh0Eh5KoPHku8VeKe3iwBlIoV5Q3XKJhrSksofEzJ42RkM8fyrm6SxwK80jRQvLAG+kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CQSPAAlU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ik3xfyT8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CQSPAAlU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ik3xfyT8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NkNl668635
	for <phone-devel@vger.kernel.org>; Mon, 13 Jul 2026 10:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6btB6dJhej2QcvzsGuKaIjQa+hcAkLMlewhHm8fby6w=; b=CQSPAAlUwDcax4AX
	4X5goqz74n0+lqKdO0aJV2PV4kgMvjLCQs1oI6Pn1ELDOLI+dcPpwV/cc2+MSu96
	Vf9kdLun+mPD3MNTRpGkwdyPGRdT84CUB9nEKA1T2nMyB513L/2qMEAdXCp6j2/j
	muzS3BSB52nixpkG3LyzwLHt35nqVdrFaSVO8ICETxsrX+yd5QGUMAZLX7cSdz5F
	Httdnc50HVpPNtTawX4Rg03nA2y2ExZQH8qUWS2DiXE+3AYfy60hPXcuKBngn1L3
	fMufrT4kcgJubjFidN9NT7ZK0WvziTaHwJ6myEV2HxT2UjmR6srKBq17fmLwgQ/w
	Mu8htQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm252g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 13 Jul 2026 10:47:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfe75b7dbso9725251cf.3
        for <phone-devel@vger.kernel.org>; Mon, 13 Jul 2026 03:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783939664; x=1784544464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6btB6dJhej2QcvzsGuKaIjQa+hcAkLMlewhHm8fby6w=;
        b=Ik3xfyT8cPGLGzo3oiGRl/ngqfeKl4rRMmlyOkRyEvNB0s3JKzeyRl+E/2wdiZrhBx
         LrPJDNryft8UIheagL0RJo0Mjrqbyxn3pHF850Zoxm+oR6mCqqvAlm8KlUxCI2MjM3R6
         14TspS3Q26FJIENrNsCqSSmMl0aRVr7s271Ndjge8v8IamgvqJ4w8v0NzXrtyDcV3C8E
         lnfrP5MDpTXUbxHpDjOF2mLZOighXOmMWvcGpM41vOBSswEoiTU0yOhRKH178WwWDuD9
         5JD4zid25AcVslJYJTvI2di0dc60Ymk9bosX8bq0PKc0tx9lws8sGr3NwPH9cdSPIwiC
         aXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783939664; x=1784544464;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6btB6dJhej2QcvzsGuKaIjQa+hcAkLMlewhHm8fby6w=;
        b=HbcmNIx6qoRBbtFjHVz68OM1656iYTGLkf9UQpCr2rqI9v8f5R4wPvgBkK/+alb03N
         bfnhtXhAyxXSOpig+q/rzIyNb5+GKEcDtWMhAfTTuMZFt/NovwiNj3kIEy1Zy49N0HKd
         SIS8JPCknSNBVx1jsGmUWsVbzjaz+2fDK6H8V+MdJw8eRuaNYPe0aRgpb6jiEGk9UJQ8
         oaVxicuCSqAnoC+3t0aKfOjdieOv99RWpNslFV+0gs/IClDFoGRFjvo2bT2qNP9bgrWn
         PABqTPSmghR40yU9KcF4HtxO5FJyeZME0SBqbSF67mAO4QvZlnEiUhUa0CwJZdHiGix8
         f5CA==
X-Forwarded-Encrypted: i=1; AHgh+Rq5GlUFvnnm522A+UXjB/YZyowrytbeHr4ucsWJaojIhAFBmF5fjCuDxdk8icvPFEWHt3dO+i9TXFa/Ww==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFDNYQeDr8sCzzVc88BSdfZsOeC3g7TXGUi4NNihB2DFwX8jSw
	OA4wV7jhNrLLMobU7hoxq10arT/OomxyUXeU8pVuIZcnO9RI4KA4KI4qbvM/SBBqXQboD+UtEIp
	3EKV8o3atnxbmPxoK16/oHn0hQ5HOJxmKwe0QOuflHUUMZBiDbpXYIEjB8L4c5kqUnA==
X-Gm-Gg: AfdE7cm9jVtBU//ZL7ypaRwcGCBK68Qg8nxwDHhlYIBvbL4ig5Q3hFbTgkl1GrR4SQD
	VM/z/b4DBcvALZQM/AKNxIu2ptzt5E8nXOl/F+ofkmUWN9kJP7XPMtSBOEFvPd+a+v5YvRpoFKX
	YSLCEXcxZkViAHztQ4gjKwWiRsitrljG6RAzqC1XoPVMDnPkAlduo7fLJ9QoTmBLoZcqCmHdWca
	NvgcEDDFu5udQN5EMkmGe8i8DALrwvYjXRgRPq31OfWWdHjwG4r2Ju3QjjvgGornuByu12pob+p
	qhstulkRJzD7pQWZWqvPqCouI++T5YVjSr73FMQPnvCZpUjnpBM6uGFFsc3yv8ITNZ0zociraVe
	PbgsLD3zHqA79ylyA/qOKrqHx3Z6Tq8L+kBQ=
X-Received: by 2002:ac8:7f83:0:b0:51a:8c9c:7f58 with SMTP id d75a77b69052e-51cbf312bdemr65574931cf.11.1783939664128;
        Mon, 13 Jul 2026 03:47:44 -0700 (PDT)
X-Received: by 2002:ac8:7f83:0:b0:51a:8c9c:7f58 with SMTP id d75a77b69052e-51cbf312bdemr65574871cf.11.1783939663765;
        Mon, 13 Jul 2026 03:47:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d3e54e83sm762938366b.42.2026.07.13.03.47.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 03:47:42 -0700 (PDT)
Message-ID: <dcea3653-1428-49ee-9287-a1b27da2003b@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:47:39 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] clk: qcom: dispcc-sm8450: Migrate to
 qcom_cc_driver_data
To: esteuwu@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Danila Tikhonov <danila@jiaxyga.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260711-sm8450-qol-dispcc-v2-0-fc1a07ac5601@proton.me>
 <20260711-sm8450-qol-dispcc-v2-2-fc1a07ac5601@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260711-sm8450-qol-dispcc-v2-2-fc1a07ac5601@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oW9Vym8-WxkkFsjv2Xdw3uGbpJ0Q2u3R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExMSBTYWx0ZWRfXw5OjNuVtoscA
 764d44KqAOpnokKG9WydUMBjFq/YIiLL+a+v/XVd2DCqaFzCL3CLHRRnLUjSALe6NzucKgSqm/2
 k3l0MKss6/Y3H0+GpvIy5wKLsQmZDAnC7CGt6zvO5/Lr61sADmDGola6Eg81TGjODtKdnpHaiy8
 rKu6nsABaJl8MVnQdkFgofNI5tbVTwrHlhgqJJEw89rItN3ILg9/ZHpw1tPfcdMqmlLBJ10sUok
 NQVPPD/zS0iwVEdeS+1U7CkH8QqZgyqK8zQjzuDcwVbA+VkQ53d5yVr3ablid/62/whl8bmKQ1p
 Hk44AhCVR9OJhkldbCftQlz2PId0KBWhtqztZkKcAbmiI8tSoJ2u6f4BPMor5cweZL2zxxoaps3
 FWDs8rZ9G8hedibXSu3pn9u7vibiFAqwifRJGc6fgWuNvWSBsFovYBJyvPpdenfAjyYehdl7D96
 b6oczKilUSW8IpMiPEg==
X-Proofpoint-GUID: oW9Vym8-WxkkFsjv2Xdw3uGbpJ0Q2u3R
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a54c251 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Nrxj5gcjSbdtpE-AfN8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExMSBTYWx0ZWRfX7gECmJ/IoTV3
 eQPp9uFq7DznSFjFdUvZYBX12PVW1uUJenkyb4CX0tuDVRfEkNaam111A4Z4Ap1CFohgFWk8AW+
 Wd+MlQ78ESFp2uCnl0S04VoxcR06Hks=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130111

On 7/12/26 5:10 AM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> Migrate to qcom_cc_driver_data, which is used by other clock controller
> drivers.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---

[...]

>  	/* Enable clock gating for MDP clocks */
>  	regmap_update_bits(regmap, DISP_CC_MISC_CMD, 0x10, 0x10);

This would ideally become regmap_set_bits(..., BIT(4)) in desc->clk_regs_configure

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
