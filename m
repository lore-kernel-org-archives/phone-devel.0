Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648F93F5BF9
	for <phone-devel@vger.kernel.org>; Fri, 12 Jun 2026 13:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270474; cv=none; b=nOvg1A3PJiqhf2RASqkZNLJX1+NI6AxRe5orp5moYnIGnnurPtr71Vz7Y4c2K2UFiGANy8tspyUl+ehhmMEVy/RN8B3O8tzAhsssunJ+JlS17PSS7Gg//EqMN4IfB22BeLa+Ddk4TdGQoUYzXV5OjjVenUWXIvCp1D8Svz8lMqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270474; c=relaxed/simple;
	bh=vy9Su2m4DmwOctrPRiAwTZvTKMsMba4B1kY7ipGYKQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TNsIgC65dEdRjQDvQpQeDeqaFio3JbBl/HphyjzO/HSHHS/q5bcKywUoWKkQb5NZeVtwcNYTH6Pdn8aIkvsKJzBGezKqLDRzZ0dvsIfsoayL5B5U8h53w1CNk0+8+O70IdLtnUsl98cCS/scWtAISiaV3ncar9etXFTapWw2m7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W+qV7bgh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hnHulXb1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W+qV7bgh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hnHulXb1"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CCj5qU3630341
	for <phone-devel@vger.kernel.org>; Fri, 12 Jun 2026 13:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XukqHtEo3vmVMvPKYfaF8yIm
	I5hN+w7/56VOovRhwkw=; b=W+qV7bgh6VpTDqSKi3W5BsAs0y+R+mGi81qqxv6o
	jW7p3uTongRt2LCPIzzgwCL6i5gSrIsyGvHSl6vn40INI1jBz0AcOw9VAPB4ipuY
	9gURXwd5Lo3GifuHaWNgzGKgyfx/p8P9r1wHLgxFIf/KRW0Vwq1rheLwIq1VV1F8
	st7FuXsnxF1+KjAyJTn4urrulrhH/iKnt1f5GjLlT6T52z1bvyJHww2uHTEya8/u
	X1hKSuuHGJXeCAsBfFJh4YuroF91RImv+XD3TRrB4q+fHSiak5UFRsRc3ZJcT+zd
	cMPI5RMLg1y0N7oem2+zNNgNCkSPmiPnNuQRLwiQ50lhbg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er165bfd0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 12 Jun 2026 13:21:11 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-964aa12039dso1045629241.2
        for <phone-devel@vger.kernel.org>; Fri, 12 Jun 2026 06:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781270471; x=1781875271; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XukqHtEo3vmVMvPKYfaF8yImI5hN+w7/56VOovRhwkw=;
        b=hnHulXb1TP4d7athtv4W2pYPy/60J7DCXlYNPVwCB2eFDULdtXbijZnEhTZ+dHK1sH
         QMHQ1EHkzbac/unduYRrCW9LEefBVylHc4zIkBYBRM3fLeSmpoz8Ou4KXI1H9iSPed96
         t5LDabAZj9Cq8/b3hckeJ7lF842mxQjj7gHSVWwuNO7znJxNzWTq2DIUgsQaEX6hqilG
         KivM+64hjQMBW+F1ROipfhAgPxVhPVwwhCD9ytll8ydBvJ91wBOfzP9kRhRVp8PeW/n6
         k0K6e7YCrU1zVnln+a/P8UJfW70F7gBwOxkpgZ6KfS7IDoavo8KGUUX9/+WeB/thwVB1
         KlQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270471; x=1781875271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XukqHtEo3vmVMvPKYfaF8yImI5hN+w7/56VOovRhwkw=;
        b=YrHLnUgoauaIm1FLl48EDvCqLjdQzp2KMCVxdSq97FDDvVh47ehB/vToQvh/ojlp/l
         ENHpbdEuz3EXVA0gmYBHOyeIRiAlWRPdnbl4tPjFhhClKmFMetTQemwVUkxE2m7YGsZg
         GF61zp3hbkYmwaWWjwut+5x+OfScdYZDzi9Nu/OeTmT9dnhL4plN+c9sGUPEwqZyFc/E
         YHURZX04bNdDnXdQQ7FYh0bU47d6VxAmnoCUuNSD1hYrmfl2WSRLZFQHwN4uaXSb4PIW
         yAgcMMVOeJ7F1dfMgqJNznFM4/EwtAfaB8jK0KVvFWGQKwjOylzWVVvzHy1XjT8zM296
         bgYg==
X-Forwarded-Encrypted: i=1; AFNElJ88cTuoBEmzJUoCI0/Mi4PlACNs+1VmP+jlbZPzTkMSPtylXUrym/wmDNR7RSlPc8AE6jkmEtsQm8yHhw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyAPNsaLnvhIesBE3WhuPdwD7IbEpIFd63NGJDxYqrjm6iAZav
	iQ2o88VNBT+M0oRlRjJybfFljmsRnAB/mItStohV6THU7WtrPqG+/VBvUOZpIG0kjVsu0310CiV
	XjbomWV2owdHBvs1Ui5FelqpXLZa2BLqbyMTg5uip6ETtwIUtCRIVWdTw6Jdqey/HtA==
X-Gm-Gg: Acq92OGrVqCB27CL2osDBDt3WvcplQofrr6vKJkBYacUgJTlTujZGIAi9yGlAA8+HxL
	Qe9drbg9uSC1PIX1ZEYJkp+8aUFNcO8+Lpwpe0IB0NDGftebRM3JoQbOkyri/eqw+CvacYtQ0g0
	hAhcBiwDhFSNu0+JroLdzquVN0U1Jm+mJNMbKSQUA7lJhHbJXx+0NSNQE+Ek+vGwjLkWOyBXRP4
	j/PH7ViRQwAH0TKQo112/RuZNZVyCOskood3F4rLYO6d1OLVL+c2vgQcfoI1p+GkNfz1DtAI0kn
	i5vIUKTEzo4/VEezCQQCayROReVMJzvVz8uhC9CyJB1878VWIXt2/uDcR65l/f9aO46cvpuQ/We
	loROnYXyJmFvfvBeTxpL4dFEUEJbSgvT54NYecsXjVn5dHyvguStbHfxz1fy9Kh8+b13RjTina2
	Q/V0VQh7ujZC3nQf1gi0c8onPl5fhsZIo4SrM=
X-Received: by 2002:a05:6102:449a:b0:631:4e9a:bab with SMTP id ada2fe7eead31-71e88c5ba68mr1408941137.18.1781270470824;
        Fri, 12 Jun 2026 06:21:10 -0700 (PDT)
X-Received: by 2002:a05:6102:449a:b0:631:4e9a:bab with SMTP id ada2fe7eead31-71e88c5ba68mr1408894137.18.1781270470445;
        Fri, 12 Jun 2026 06:21:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f190ddsm5867081fa.19.2026.06.12.06.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:21:08 -0700 (PDT)
Date: Fri, 12 Jun 2026 16:21:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: kodiak: Sort pinctrl subnodes by
 pins
Message-ID: <yldq3k36hyzwz33lmw3oj7ix7uzs3sl56wlgo2ho7sosjge6hz@64zpgubj6j7t>
References: <20260612-kodiak-cam-mclk-v1-0-fd294ff003a2@fairphone.com>
 <20260612-kodiak-cam-mclk-v1-1-fd294ff003a2@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612-kodiak-cam-mclk-v1-1-fd294ff003a2@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfX2jcUjCncLhvQ
 n6qKWHRNBrPffnJg9sauBJ3xDC+yIjbeVVaJlhKBC+NzMnKssrd/DxL293AK9Hn4DfacjM3ETxL
 M2p0NJ7ZZImwuZuqpaQEBB/EKYnijnW2okTbjpVBpNWvQ6VdE3dPVES+QYJhlJGlP3r7BRRm9IJ
 ZuEEw6aXEYTfI4KMmSGHwCzX9IrT4shgbG2uaw3q01g0PkY0nNPXTV2U09v7EC2jm1y4jDdejse
 M/A4EYeVbd3LL6NBJgRXDNtGVFUeB7qH8YMI6475jFa9ginhfuT5g73O2WNyj/819EXe26pqpz1
 qluDZ4cvZ6hw/VOKexpCLF5fK2qg1tSedX93HJRTOU2klHP7VA3/UPiVilIUxQms6aC27VXDXnk
 uF0Ma2IJmSAR+o3yFtz8OgtkayCUOU2371O0184QvAmgBZtxh+Hgft9g2eF/4gBrk0th48L9Twi
 uLrMpcM72Tr4+TJnIBQ==
X-Authority-Analysis: v=2.4 cv=LNpWhpW9 c=1 sm=1 tr=0 ts=6a2c07c7 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=IT9ScGb9VJkqv4s7YT8A:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: eUJAsZmzwn3rV1EsXzgo3FiyYwOK1V-q
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfX/Na8b0G0snty
 98kKj7b1+2kFPeooZ3aIHwPxPOdp2RDfK6h0/aeLHMmwM2AMnMd2wmui9xjCuJutMYxVCBYMR5/
 VOUOLXz3/brhvt7hm2UKGro53Npi0IY=
X-Proofpoint-GUID: eUJAsZmzwn3rV1EsXzgo3FiyYwOK1V-q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120122

On Fri, Jun 12, 2026 at 12:55:51PM +0200, Luca Weiss wrote:
> As documented in the "Devicetree Sources (DTS) Coding Style" document,
> pinctrl subnodes should be sorted by the pins property. Do this once for
> kodiak.dtsi so that future additions can be added at the right places.
> 
> No functional change intended, verified with dtx_diff.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 1382 +++++++++++++++++-----------------
>  1 file changed, 691 insertions(+), 691 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
