Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6367C2EB840
	for <phone-devel@vger.kernel.org>; Thu,  9 Oct 2025 14:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760020890; cv=none; b=fqfx1e0fYarWOZIUbNfEXutwcPJ0xo1xYqxdID22bk2k2A8bSCLcplgugwUKxaJPXYiWoACtkLIV3SmtxiuCxALjtYJCVsA1RxLBeHi1F1C0NmhdrBI8Y4IRkxj8DpEsmLuCNlUlgn5Xag7amVjlg16x350Te1BG0YiLoP9QoPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760020890; c=relaxed/simple;
	bh=hMAlIl8gIK8LztwW9HVQfeQYtg5hZj6rasv0Brdvkx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sXbIYm/7K7AplpkCkYvttWxLtSwXRszupN26UTGJjYWihpHVPmoVD03qMU2pJsTNWDGvSYPx5vVBmRQ4rRlp/T++YYzkQz6FR9EkgzqibHknapOSAEzHw9GpcEvpJ2xfSHbpAWZ7+vAjkaPZbZdvT2q9EWS/8ML8suFia4iKV9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ExdeOdGT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ExdeOdGT"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5998V2qe031782
	for <phone-devel@vger.kernel.org>; Thu, 9 Oct 2025 14:41:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FPQiX2366I2f8Av1zpm9cGRd
	bl2lIGNgfsiAginJlD0=; b=ExdeOdGTwivkH3fbQt9LUnWGOabIJ8LV0nM8sVFS
	0U9BNq8O77c6HfHPfyVJCUaciOFWFlvH/JdSAVS2Ch29beH4O/pLHyDk/x9k3wPD
	EcSAZr6EhSX9vTJZ+/zoCa0c4R8d0rnqZkq2XXKYiVKSfSJK8f3WgjgF6cprOQvB
	M+90L3XbLWixakVTrv7KeUvmiHzgNyc2cTLj7HjL0eH2cc5zWLlxvcoDbPE6j2B0
	ivdo3cSFqrZqDMBtsvKWh3TNdbhlYl1DC07e4ajBmrSZTPmWzkkpFmg8VEci6iHm
	SMuBdnzwqZ+wcar/OXiqKjw4MDQ2qI+X1mwTlU2tPO51nQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49p9m0s5hm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 09 Oct 2025 14:41:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4de5fe839aeso38077431cf.3
        for <phone-devel@vger.kernel.org>; Thu, 09 Oct 2025 07:41:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760020886; x=1760625686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPQiX2366I2f8Av1zpm9cGRdbl2lIGNgfsiAginJlD0=;
        b=gAyW85is5nt6Pun4YXRsIn3QW3HxnqG/Gmy3/ogIGxVLk0R0BYTyy+aAHnNwKuVLf/
         U++y8Zyh0fMgMTYjkM6qrI9uSKJ4csAK3Yn+VxbM06qIMyG+kBW8QQJmsq0Stof3SjCG
         2NrrTeTJ3XYvO7UZGc4yna/+pmNVju0FIRfoxnzysr8U5YBbEdcwkd2ROx2L12EAEF9T
         JvfUCxld2LavIdujEZVUxBKHWBlyJ+2+g3Gb0E0AFjAMsRNp6/PrabDFuyXmrCO7Ub7E
         lF4xrAPJOZWa9lfwzsSRVrhgJebnb7FvNtVciJ9OXghNXEMxeIt3gblkpylodo+DcIeD
         8WxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrSsaUH6u5DHYgOkAeWBulC4AWazDn86F8gY5Y8g3vMdE6k/7YRtJpgreT2onnqFvwPA7SuNso2VzYHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJAMaUB0oGg0JqiJJjmZ8ZI3y8Mm6sPCUG0TkEybqCUaNPRxeN
	0QsroJ1gWlvI3ttCjrPh09ZUcODrCIxczsrwGGxzdCyrBDF7pMdWgajdq2wsRL7ZkQgYI0RRmoK
	u4KpzA2k4rFNirwcLNN8Hj5skgf7gsJvLro35bm3+rXiu74q5aqicu3YrxFovayjgdw==
X-Gm-Gg: ASbGnctxRndncc8uCwdUAVXMU9BLb3rpuQuRnWWWUZ96NxNcja3SdaLYMzbFifgL24n
	gcCCJRBijHzZPjh02HbZJoHLRQrzjUOQ5dApr8tmF5xPdQP2FaQypekkORQveNjZ/imZqlHAa5f
	UCJoKoW7+Dlrx/iT1CqcL1lEdy05aBKUrp32ss9hO3lTCfvG4whDmV6Fcn9olB5xceXGHyHjCe/
	9U3cY8DyPi8Sa/XKiSGXYSdkT6eqYYOvvSYepf+PKwyHm4I3wiH2sPeVJPP28wiORo+C8731IGo
	q1GBr5kQlMPhoV22vgcOujBhSixw3uHTQAcJ4O04Nf+61iKEMA2sZBsZgyoHC/BG1dIIdZ/mj6j
	8+m62wbQkU1b3s1Iz381Msnb47v35wwH/Jgs6sNF7rRF9JOPAmbvRGIHpXQ==
X-Received: by 2002:a05:622a:2617:b0:4db:5202:d4c with SMTP id d75a77b69052e-4e6eacd239cmr116681491cf.23.1760020886372;
        Thu, 09 Oct 2025 07:41:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQCT9fe6gb0r9Ti2FL4beKrwqnfcI7Jo0U085lbk3COrZ4Vvf6eZvpSGNwWHODrCy2DfPJ6w==
X-Received: by 2002:a05:622a:2617:b0:4db:5202:d4c with SMTP id d75a77b69052e-4e6eacd239cmr116680621cf.23.1760020885608;
        Thu, 09 Oct 2025 07:41:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f39fcafbsm29930991fa.26.2025.10.09.07.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 07:41:24 -0700 (PDT)
Date: Thu, 9 Oct 2025 17:41:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Alexander Martinz <amartinz@shiftphones.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: qcm6490-shift-otter: Add
 missing reserved-memory
Message-ID: <an5bytw5kee2a76ezpmw4w6n2tf2dv4gr7yblfyfluhxwk2jcu@t3dga5hvtoub>
References: <20251009-otter-further-bringup-v2-0-5bb2f4a02cea@fairphone.com>
 <20251009-otter-further-bringup-v2-3-5bb2f4a02cea@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009-otter-further-bringup-v2-3-5bb2f4a02cea@fairphone.com>
X-Authority-Analysis: v=2.4 cv=a/U9NESF c=1 sm=1 tr=0 ts=68e7c997 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=7Ovdx5uLAAAA:8 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8
 a=bVQzUrBaaxfiXJaSTkAA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=TQZWkJv5rNK5-PaLMsrg:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: Xjr5BMhxFxxyCuJ8MBFzUDt-ncg1J6tP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA5MDA0NyBTYWx0ZWRfX1bjCIc163Jtz
 15O5EuErGScCBuwkDRh898jaaPn3OGTYzG8Y/JqjAITqsxLuITQ8dzAyflH9FOubQaDtgzCPDNa
 fK8wRTD4xoZwKFe6R0NoQ1eyXgDFMUfHb9uL2+E0TfsoynAtg907zs9ZBSxZJ9sBJNqtlI88m2z
 MV+WfmIi9TE1Dj65iZmNLLw4zRcfmH2G13oOEKvEKRYSnGbyVg/vTEOcgOr2mWVtVEOHRUKiPcX
 GW2psoXv/OFuh87sGTw3wCXvO4+DkXH/WNgnEeMftLKdr3Sd3fKJeVkr1/riJ2q7LOz1drGuoiK
 dakIAfdx9F+dyNZloqVYZIq0Of7ztoba7fGTdtOiGoIVm67+3tGWKxnsoi2gnmTMGEbhtqqVi2/
 n9Wg/pqmTPaXEvTt8nQWKQ/ML36+qg==
X-Proofpoint-ORIG-GUID: Xjr5BMhxFxxyCuJ8MBFzUDt-ncg1J6tP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510090047

On Thu, Oct 09, 2025 at 11:06:33AM +0200, Luca Weiss wrote:
> From: Alexander Martinz <amartinz@shiftphones.com>
> 
> It seems we also need to reserve a region of 81 MiB called "removed_mem"
> otherwise we can easily hit memory errors with higher RAM usage.
> 
> Fixes: 249666e34c24 ("arm64: dts: qcom: add QCM6490 SHIFTphone 8")
> Signed-off-by: Alexander Martinz <amartinz@shiftphones.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
