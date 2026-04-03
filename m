Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09263CA4B2
	for <phone-devel@vger.kernel.org>; Fri,  3 Apr 2026 19:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775244795; cv=none; b=WQiVVkFPe2CfpMFP9ynY2UxlDVr+XDdrvUHC7C4hixae6aBA9qucHsd7WHZCWFwa5Ru3OBWnuyYq4pRLD83/3Yc+18DcZNmXC8HHshSa3x0xSmuRjzgOMZ0sQo8lB/iTpjeefSycpK+pnK2ODiHyne/we0avGKO3S7BG5dKGZzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775244795; c=relaxed/simple;
	bh=Nm8bVhXwnXi2Nj/UAQqeoQnFymro7OZDrrWhb6FQxok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U1k+WnUD9yQsOx8EIjCqiCv9lVQTwSQlB6gJpYnnLx7v+1s9hy68qSoVtRasE7ap6tDiPPaIqgiX8NUrohJXsGgZclffLgiRpoAkYDTSRx+UBZPBTYLUb4i3waIMg7sZqXX/UNrqhb2dD2OEn0qVu2pGgyiKxTZCWRvW27qWwtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SFXHOl18; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=is3Y8BAc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SFXHOl18";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="is3Y8BAc"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633EY5lN141947
	for <phone-devel@vger.kernel.org>; Fri, 3 Apr 2026 19:33:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hYnQcnhGrNgV/eoN2v/2MbLY
	nIbeQOs3Yrb0qovNiyA=; b=SFXHOl18ZrNpJYsxzN0alNvOumMDCNM30qEr/82I
	PJbpGr61yKTxM0Ht+vfdgHQSS2ODMl4CQky3KuOEgsguhcW4Km2MHi+7ZfeGHCxa
	dKpua3ge4HBlz85i+tZGv5RfTHQCsPTxgSSKm44+pn6FdFyCpQFnzY6W9Yoh09Y/
	hmTWqqhtVosQ5po5LI6q3xPp6p0KpdqSpv/yDNICpnVXYIcp06rC3wC+WWfLdJ15
	pGeyH3O6nbSRHIkySc+L6Negk+qMi3rhyOfxdHK0fuQYpOyKWnWH5X+WiI+zicaS
	JZretIRWjpOFR4hzxFjHhRC9fxX3nR5kh0M/bU5r6MpYeQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da83y259t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 03 Apr 2026 19:33:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5093a985e21so59712021cf.3
        for <phone-devel@vger.kernel.org>; Fri, 03 Apr 2026 12:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775244791; x=1775849591; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hYnQcnhGrNgV/eoN2v/2MbLYnIbeQOs3Yrb0qovNiyA=;
        b=is3Y8BAcfRynBV4Nu4AKdq/aw8T1bXMd9sJ2d/7KuXUdiXhT78V+B49bw0ilH7E2fq
         3f7xmgwuYZddm36Sg7VTN7zRhz180X/N1PVpo6ahVBFrrlNn7P9pYU+laiZDJhd/0UkF
         /QhL0vL8exMrwh49aPEaxAZXybsL4Xmc4iko475AYdkJiV7GuulMNlqf3ikCRvOvosej
         lBCVSxaWCqEXgeAeOw3fyTR+lPhwNwJq24tcg40d29qN5v/du19hA/xfLCbQkQ0yu8sx
         KPQzGDtrb/z6VLn5BQGJ+rvVRyUFZHDDdjJJU/6FMBpHIQiS5w1sfifQL+dkK26OyaSd
         rY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775244791; x=1775849591;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hYnQcnhGrNgV/eoN2v/2MbLYnIbeQOs3Yrb0qovNiyA=;
        b=TIvMr8ffECi9iMqpDtga5NPFFIQRec8imY3SQpT2p5TCLX4y/GXWwGaOq6FxJGXMGL
         sU7TCpV4N1trUFigURue27csYN4dFMHmUvE9hEERV4rXK2q9VjPsZyW+jKpEsc851tR6
         n3d2HNoRLk660cc5Ck9XYXzIR4dIuh/LRdxmoiDK2dM1I6TWwTLg95rH6KM3MoUi8KWk
         m+dqz973v/sxwlmMRfEhrwrHoW8L49z1ZvCeRSaUBbC1ajhRmaFweXjD0DTkJgECG3WN
         nLIdmTSFZkelIvESXJemcgY2MVGYBLB77JVupM3HBvO6+a3xM+QwlGFt+SIr/sd/yH8s
         0Mrw==
X-Forwarded-Encrypted: i=1; AJvYcCW/Q+gCNhhp0h25G+ozHH5lSOVHzAxWDIfAe4D8Vo37UGIQlWsb2RIZxG1UJdyEHigqQZLNgYvlRbK3fg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLtNvVlhrsVT2lGbW/0VnU1/7iOzYNVNxPQ1hlqiNKasRAY21F
	Xb1iEvXE9xLYSWXuMVnPh1nCmb/13OWP53Z/sk9ARBlh7Lb6V96WHdCAg6hhpOcGs+pEIkOWG18
	YoIE1yzAYnNFFoqyRNJFFqWfLMzqKdCEc9S3t8xmLju2d9hcDrdyKJBga8DDR52ruRQ==
X-Gm-Gg: ATEYQzzMclPHJtWGni76N6g9cePlOCK3PjPd8kjOZztL5hbj6IVIh2RtKnHkkRPmEoc
	GZM9onFHdMLkyIB1RlQSYPTir8YJPIQWORxpgBtyR9LuT2nU6QL+fkle9epHpIeVp3RWYOB0ylC
	fukb0ICv0jqHtWQB8gnJ8uxYDSheTwbFRM6IEF9Vhixy9653HzwlyP+Ikfz0Ogxn3x0yu9fftQ1
	olpb23aF9o78+4FMEdGNzK9oeP/eo8QFGTOkf+fC/xY5g9KrZQqjEAUljlCQ25OCQt6Ymdg6Shc
	WXaZXYo+qphR/Shi+2KigCxbZCnM2evXLm5cUYm9YRC11tYoknZxNGT/dDtcxJEL1ItntXSSUR2
	+3cu5PdnY5hkM6YvoKXyu4ZzVSVt/hvEiyUeRrO8UnmQZUWbs5RZuV/hAh8yWtIEUsllMw9p7cF
	HW6J1/wE05Gi5AJQOqdsFdV5N+ybAZdj0cEY0=
X-Received: by 2002:a05:622a:6850:10b0:509:481:5365 with SMTP id d75a77b69052e-50d62b02630mr48691001cf.50.1775244791163;
        Fri, 03 Apr 2026 12:33:11 -0700 (PDT)
X-Received: by 2002:a05:622a:6850:10b0:509:481:5365 with SMTP id d75a77b69052e-50d62b02630mr48690431cf.50.1775244790654;
        Fri, 03 Apr 2026 12:33:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c9cbcesm1654085e87.21.2026.04.03.12.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 12:33:09 -0700 (PDT)
Date: Fri, 3 Apr 2026 22:33:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: milos: Add WCN6755 WiFi node
Message-ID: <7edl5o4lc2jk5exozyxomxjzooqqhek5zyvmp6e3p4ndxweulg@h2dwmk2zizgj>
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
 <20260403-milos-fp6-bt-wifi-v2-5-393322b27c5f@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-5-393322b27c5f@fairphone.com>
X-Authority-Analysis: v=2.4 cv=ar6/yCZV c=1 sm=1 tr=0 ts=69d015f8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=nnh3LCdgXL55amKsc48A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: -nDfDFV56eqrva6sIncT8r68Gx5d4biJ
X-Proofpoint-GUID: -nDfDFV56eqrva6sIncT8r68Gx5d4biJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE3NCBTYWx0ZWRfX0s4fzxnFdsCS
 RWynW480pu9jd5CcEApY07mZTO9Al6royFcLbqrAHzD3WdvYcRcbWyJRa07qlOa/1G0u5SSgFgb
 ZF0txXzEWopaJe5pLJKd+hXhX4sfKZzL4UXASWL7cl+THIImLAfkki1FjLwSJOBm3SnbAXn492p
 8iguh1eY43IwFtLlaMKjueW6owXNpUm7CdEwoJ+VKJgnKgt5t2blchwV8TpSIQJ6reOP312Np9a
 1eYODmI8SHkv0tAssXUL8fo/yNtBw0n7/H6xdfN5rvVD6dQvi996e1tWJz30Rb8kL3nTH9fyrMF
 k33q42VgJwrDpY/YAqk0iGzJKl13F13R9qz1dmzsY5yszxb07G/2PGT8spWMNbaxOkrMtz8IyCs
 IoZfuf7ZzlvF2OVTVP6Tplxcu5bSeo5ITEO5C0D61DXwDtTSpEh/QNwXJjsSTDxb/An6CB9410U
 BpKMG27VLiuXvk9SnFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030174

On Fri, Apr 03, 2026 at 03:52:51PM +0200, Luca Weiss wrote:
> Add a node for the WCN6755 WiFi found with the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 46 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
