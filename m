Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794228420;
	b=EF2vuYgg5rJyNuJ30MGRXva13Q8jG+P8OYjsv8HHpDVrKrCDBEc0SuWP/90JaQy13hJe
	 VlW+IuNB7eFb26oUR3mLkjfodO/am7QcR7qUeTT51N1lG1w70VJAqisVxs3FNW+7jsars
	 B1tAlBelE7QW835u0NvcdI/+2+g7BmApzWJZfvWAC0ZvFiyroYIUeMet4vArWDdTvOjf6
	 Uw7KS+3ocDZLFQLacdyIbEHQc/z6CHO3TFnRLFSPeeCEBL0A22xINDY8MbUWcA6dGQ4s+
	 Mp1UF3ZQJ0mo9ne8kTwrf/cGTNA+vhiFVFgi+/5syXBpEdlnxUFm+2viMfmrWGtRMDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228420;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mEue+rSQb3nzOUHKOMWWZHCVp8uvI1D8kOmCoL2tqFA=;
	b=EJqNZefA42D4C7N8iKMeSvhbV4RC0PH4R5Jak4xMZ4FlXijbRyhKT0UJnp2lZiyccjaf
	 bSMO6yO1CQRHitsU5ya5LbDBcixpQU4H4FDK8fgQTumu+fhwAK8A/scZmqFzHbEHjoNhm
	 skiE0mYYgQ+Ogp+zkDjtDAwxuwqALSTVyuMvRFN7pmmrsUeEKaWTvmZeBm2S7HcShcpgZ
	 fsUQ1ZXGyOxegLiS8yDiVQB9fKy8FfjfhZ9300fKWoQwH8OxVU4s3L/mCU+b98IZglcxu
	 2jRk40By2t6w48dGdQ3SONePPwI0a9VHdV82cxdmTf7t3Lk0vOa2620bmMD6zTV/BLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qz1Ad6Fi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gXb3p+EM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28840606A325
	for <phone-devel@vger.kernel.org>; Mon,  9 Nov 2026 12:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28840606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qz1Ad6Fi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gXb3p+EM
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99unO92502957
	for <phone-devel@vger.kernel.org>; Mon, 9 Nov 2026 12:46:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mEue+rSQb3nzOUHKOMWWZHCV
	p8uvI1D8kOmCoL2tqFA=; b=Qz1Ad6FidVrJ8nbK9hpcuyv9fQlFmF3jlggJ2kOM
	AOms8H7tNY313Zy9y4qWstid0cyX7p31yTGEIpZ6PIhiKe0cu0flg3Me5XqHOx7I
	B3odHkHaDOMOnOnoq66TcOnzMUGHwmcp7ABZvBiRy15iU/+agzdsAK/DNMzGXks9
	UYFqRcpQPXkfpxpghInvlSCLWbi0D/xKbB54fk0+cs+7HAJPQew0SzhHYdK6YCO0
	JRF+vk/Vg3hphgYcEEM0nmbw6uwY07GON3WE9jKzrVlCqOCR49tdkqffbWjFAkzF
	cdbXhGgENAk6uYDIMnH3NkQxcFH2VVFHQHuCD/D6M93EBw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hubt8rm9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 09 Nov 2026 12:46:59 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ece7e4af28so818474e0c.1
        for <phone-devel@vger.kernel.org>; Mon, 09 Nov 2026 04:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794228418; x=1794833218; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mEue+rSQb3nzOUHKOMWWZHCVp8uvI1D8kOmCoL2tqFA=;
        b=gXb3p+EMOx0yPrhe0iwTxJC4dCdRLQKh2RIMhQyQbQHx8YhC9VeZpRCknJMJX/UIs7
         UHbXWUhAT0RHNha+J7cbLILcx0ORU6U1ta7SF553ooISXMgWNyc84/fmfPuffiLolVhY
         1ljUC8q49SSAEi2eZeRdsrWQe8Avmhr+7etXb9o4PRjZSVVt0sygoDnqggQC9N84kuJc
         nzstmcN34oD++PdvzeULqm+XV+V+tM5ABjPl9sOMegdfzFSspMvFsfxtWoiiommqynAz
         lrlAckVgFpTMe0Q2fwhZ3REaDMYRcJXLRkr+0BKNbwUpwD75zMlonLEhFWCQCiVCTw8O
         O6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794228418; x=1794833218;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mEue+rSQb3nzOUHKOMWWZHCVp8uvI1D8kOmCoL2tqFA=;
        b=iMSIa9Xb+Aj4EmmxsJC//h9z6PxOHdzNw4p6QbfSsAZjgw1SvKSNCXeafBobOeIuwD
         ram4ylxIVBdrt4ZEBvEvf+8FPX6hGK032M2En2RvVpB5yMYQKSZDqmIjJlqeBd0boLRK
         Xorn8aCD4XqHrjstVnvG2/tmwFeV2bI/9P5uWu8wdf/CDFLBd1dKwBFuc5A6v4FYnblF
         NUDzlTyve/ND0HTP6Xj4u2Zed6gw4cY+bUxwa1uPTNkFZFbtHgmBdsfwF37PZkKiGu9N
         Gr2Vev6Xk+8ih4qJ5A5r8Rix0NdeGsw3lURbRsfCpVT2JfiS/kZ9ec6VWlzikah5DrLH
         ZG0g==
X-Forwarded-Encrypted: i=1; AL+hErHeaOX17HdyphAov+3beF/7LIkKDSQdK34SlWGyCwVulD4CQhZRuDx3MunxUsiOCriBxXxJql2/nuouiA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/D996W+lLGz/gj8RAPEwkMhESamqM9l1M4mFgIfqcH/soyTEul
	3SyQmn2yYiFzBPc4I5i9VRMbM5pwiyE2V1Vl4TLT8kb8FG/bf8SKyAYTLoMrEF+JuskCwJIAvzk
	0EsDEIRahOPeUDRu0y7AOw8bU/1AhTDPPlm9f9pQMYFSMc5XXFfcoVO2LlPQ0VC0rdA==
X-Gm-Gg: AYBFou3NMjchkyc0LPg/ANBxrufA7IIugR2QurjF6Y3PBzl/lMEuPRzg0QnvsxK0fRw
	Oj723Tak1zdqdYoPoAOflrbglY1oXV3Pyny1xaFZp+4EYNkc9mfpDuwG3Ktu5DT4a+tnlD4iMtG
	tUcb2WB2COSDaU12eZ54wM9h43ACLK6uypHEsUI/U7UBKZysNllxvqlHqC8NKycchI0KAirqqO3
	u86OwuiypcGYGN5EEAxVshmwSvmEkHwuTuyjePRJFLhEoPeMrJeCh4hTXeH0wQs3YbMyyjHMPng
	XbDlvaOvXzTaY5W/vKtdroW7go1h5yXm2za3Bowq7bY1wz7GTNsqT+QhWYBOsXGnthKcZ34odbW
	OdzP92tVC+5XgR0kz8KcMe8dRvxo5KCMlyNjP08KnoFpBqLoZCA39COtpccGOgj0=
X-Received: by 2002:a05:6102:6449:b0:7d0:6cf3:d8f6 with SMTP id ada2fe7eead31-7d2db2b0ab4mr1094392137.28.1794228418043;
        Mon, 09 Nov 2026 04:46:58 -0800 (PST)
X-Received: by 2002:a05:6102:6449:b0:7d0:6cf3:d8f6 with SMTP id ada2fe7eead31-7d2db2b0ab4mr1094372137.28.1794228417406;
        Mon, 09 Nov 2026 04:46:57 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad610sm539537045e9.3.2026.11.09.04.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:46:56 -0800 (PST)
Date: Mon, 9 Nov 2026 14:46:54 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: david@ixit.cz
Cc: Dzmitry Sankouski <dsankouski@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Petr Vorel <petr.vorel@gmail.com>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 09/10] arm64: dts: qcom: sdm845-google: Move panel
 pins into common
Message-ID: <6hk3vbvxybzrsb3nli6ysdabeb3npcu3ejozhz4aerxaytjjqu@dfqjpnufsa3t>
References: <20261108-crosshatch-panel-v3-0-87dd4ec4f7cc@ixit.cz>
 <20261108-crosshatch-panel-v3-9-87dd4ec4f7cc@ixit.cz>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261108-crosshatch-panel-v3-9-87dd4ec4f7cc@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfX863BaA/IycfX
 mAWNaOogPKP8zG8UdUZ0cLB6fvQbH9qqJUtivGKLnTJaf7njXxTrJSRp9EHTUo1RQOuNAxoRfKj
 oJ8XxICWY18f1JV2QRT3XZ2uwllp790EVx/fTVfVXrS08QU/6+cW8rU7bofXBxWkLzzgA2OtONW
 Bd5A25ik+m4ALSBnAWT5PYDtgE0ZmtH8zguh9VXyPNjFBbpIS1a2xsNyE9foVJ0XkBPVGKKEprg
 JRAKH9MHYWOdleSFBtWRzf6H/E9HknreFafYFLzLpt1+Kvpiee8ft5xnz1ujcadxEzXqUB+bMl5
 PGN1Wvjj9oB2YgHmlNcsO/NLbr1W1de+yilWeUJkyRsknfho5jhGmMLmMdMHr4qbjXcr7gpiYj+
 3/T1V59scP5b4X5/24To6vuG+VNGsZh0izF34W37iod3rm7d8nHXKxUfiteFbQaU6crnMxgYUie
 CHr6z8jH8DjBl6O4Ifw==
X-Proofpoint-GUID: HX0TJAdNHKfJ471LZChti68-5DEgHR0W
X-Proofpoint-ORIG-GUID: HX0TJAdNHKfJ471LZChti68-5DEgHR0W
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfX0YFrYG5Y+eg+
 fAOfXaWSyrQrx/Xv9Tau454UoC295Oe4QEC8u06KnEoTs8t8VXBdqFiI8+TQtGjl3TipwbPDKya
 dlrwbwzXKEReZoMUCHYUUWwLx/tRoYY=
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6af1c0c3 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=jgMgYrHaTVL-YdunLg4A:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090050

On 26-11-08 12:32:30, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Both devices share the pinctrl configuration.
> 
> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
