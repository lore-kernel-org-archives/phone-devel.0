Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0701826281
	for <phone-devel@vger.kernel.org>; Fri, 27 Jun 2025 01:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750987734; cv=none; b=rzJ3hKG8d+Wura3/s7atzRspfIaZvqyHFmsXMGA54ZNBamBUprGNi/ANs5OxWiRQoZCEsPRuKPg3/YaG9KdiszOxGxiZRle+/nDP/kMpTX6gWAtj6G1A+y39HKawytPs+xHaD+1TxvdIbEidpfyEboawDuon3Nsz+DDFkVzVvNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750987734; c=relaxed/simple;
	bh=mLhzT0gbEINjxMyIEBcYQYBQbYT3gPLBbXmxqgDjbXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AwNoLi+MVq1FWu0cNNeyp7Yt5BlnKbQfbIh2kMA0unImXovMQMQlIevw9DSzmFzsNjqe+rU7yPH6PmfLZZEjBy9RUPLV04mlFPz5RObJrRmS1BAAMxSRsmAVKiTJoJoL2/l0hCV5EC3fQz8tnA+JgTZhGlpp8YgfsKkRI8A3+o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DGiJoNa1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DGiJoNa1"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QJ8tdh018859
	for <phone-devel@vger.kernel.org>; Fri, 27 Jun 2025 01:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7BHttPaz4TxUNQzBLNE+418p
	FfXOu6+pWP6NmmNpoHo=; b=DGiJoNa1uPazrx+2KERUtSEAXuqt4lVnru3pvqJJ
	J2DFGQVD+8mf+Fl2GVyLhAKu35qYZb8sSEmA1WTSMo0Jt+paxrecMa9BzYPO2Wnm
	KYffpuY2cfCquGg9F5QyTYfsJwHHOucH5FURTX31/PKx8gYxn0BRN6Gp7mT7A/lr
	BLtWaRVfMJNeeERQNRTo3utljaZdI1nnWrGe/cs9btcI01h9BslyF+08y0hFXGKe
	THEzYiPVEtomHF/js31JRvJ927aFAn4gc/NwzgfNid+YfsElOPJc2pjMSfsq0avP
	G1UtWR4nTF2oGSSpQ2sGFu9qddblmKuJfXZMEBVXsbUFtQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7tdf20y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 27 Jun 2025 01:28:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d38c5c3130so236991385a.1
        for <phone-devel@vger.kernel.org>; Thu, 26 Jun 2025 18:28:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750987730; x=1751592530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7BHttPaz4TxUNQzBLNE+418pFfXOu6+pWP6NmmNpoHo=;
        b=iekl84szBGCsjcHdAKRP+gmkWhynmGuRv9xlRfiK5dkr333MeL6xT01RWTRGxgIkm2
         sVBXcksZYxC0S1oFuaFv8OUk1teIIXSwxK1ekrMDXw+39OPSlUyHQLBjI8H9orfj4wLW
         N/BZC5Z+pbVg/ulj3E9qs/MvxiSjVyvCZp+gMAd28/a/YEMlx8l3zic8gk/MttKMl+4k
         M5rFiLkjgs7QsGyIrUivPdbdOXLN6Xn63oN1qkxVI9YhBoGsjkE5xWbdw59sm1Tz6Bnl
         plhuRGmiy7EzZDzwZ85fK1X+Jjgsmj+ePlzkPl69dDjJ34HvapJmXUcU2rRvnzf6duDx
         AvYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxq1JqZSkCcrVMnQ+zpph9YOFOKONKCkSCOPXMM1I7ABIBDbcIMYnPuipwPT1PtjxRN0yr/RgLRLu5vA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6qaH1l6nGiOMIoCv3oS1DHq0O7wjUH84UH7YjtxlMfoS/BmmJ
	yMJO/2yigK/7RbWZhYDAl9QPi6B85qykKmhsZTNpVvwLwzrjMzZcoAdV/wxlMrmOSToNIWN9XtZ
	OpQ33zQW0Ndgwr14Ys4ei0OdbLNqIEwh7mEJo5GXLOyNYphLBfRx/UyCHbUP1Ik6tGA==
X-Gm-Gg: ASbGncu9NdKq6AXhzVa4WYaKciDmomh9sfxV49fDGMjU/XAimC2b0FgSg8OYAbHfuRc
	HygegPxpX1FTCkuHDdmZy8i5haRiiN9nKrfQllTiG6MM1xrXS0DCTcFxHTLwB/eFW1ZWDbF1+AZ
	RwMmeHNtZUNIjNJ3uDORiX4fR2+GA6a2dKg9IPGiOmgSINaDTY/bav00QAY1NQIlKagRNtl/xCM
	dF75HZKb+bHxqNT+2+Fc49bZrfG3HDAVOaMCOPId15APua7MDG+KMn31AtpWFvOLPGwdRSbzh8w
	d+ZKbiGrbr651oRiSGw3n1oXpVwXNB4PL5LIjmGZM+dlirF2/JFFce7dxrlAmUnM0vICh57yiIl
	SShke+rhil+Wgc2OLE8P5XYlEEFXQ+SBebp0=
X-Received: by 2002:a05:620a:198a:b0:7d3:ed4d:f1ba with SMTP id af79cd13be357-7d4439b298dmr282411385a.49.1750987730524;
        Thu, 26 Jun 2025 18:28:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4mM93pJrmTOiGI3AS8mbJSAOrrA8+GDhMNzP/TNmnR49p+KAgomnY2oA+PJOFrHgpx9euiA==
X-Received: by 2002:a05:620a:198a:b0:7d3:ed4d:f1ba with SMTP id af79cd13be357-7d4439b298dmr282408685a.49.1750987730124;
        Thu, 26 Jun 2025 18:28:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2ee85e9sm3688701fa.82.2025.06.26.18.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 18:28:49 -0700 (PDT)
Date: Fri, 27 Jun 2025 04:28:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] interconnect: qcom: Add SM7635 interconnect provider
 driver
Message-ID: <2we5y3aimhhizbsr6rvhpvtfkzl35lvpqr5vlhpxzsdcjudlqb@iotpzxpksveq>
References: <20250625-sm7635-icc-v1-0-8b49200416b0@fairphone.com>
 <20250625-sm7635-icc-v1-2-8b49200416b0@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-sm7635-icc-v1-2-8b49200416b0@fairphone.com>
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685df3d3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=lAZXaacekHF5OtbiRAEA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDAxMCBTYWx0ZWRfX6+m3GKbUQ1En
 zD5EnXIAzN01DyrcIvFwcIgbHK/JuVA/2Zq2iwJDdeXRcq8ynnUbbVJNyPRxTvsDz54voCgyg1v
 VdUdfWF82fCCOLfjFeF/nC1nG+M1IAmN0zkxe3+CQkI0zWx4yMaDramZE0RxXJrppihoULC8YwH
 blPoGFKpmwyUuxEHeLjBs7LYZa5EwleHtqiAAa8o0ai7zxjPrl0wrd1rdUelFE9EenU9vXyzeBt
 IPdyvx2VjMDdtxX2mmvUeOw7EsKQTpxpSCfXXQavgDEyJWW0/qJf3VhNrFvZZLhmAy+TbGzN4YR
 KuKtSA2QZbgqVLOnAitbGhrXIm6s3GH8aq7Lf8nY0fRzd5OSCup8wewcyTLGFOXzoZ2QJZPp+/E
 VKifJMvS8kWylKLLl7EViLPx987zvvvmZjVFezV0+Tc2hBbHWT3NtOj0CvEgRmljgjjx3uUZ
X-Proofpoint-GUID: 4J7FlTHlpxrKMd8yPIYwEOiv_2NFeBNT
X-Proofpoint-ORIG-GUID: 4J7FlTHlpxrKMd8yPIYwEOiv_2NFeBNT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_01,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270010

On Wed, Jun 25, 2025 at 11:13:48AM +0200, Luca Weiss wrote:
> Add driver for the Qualcomm interconnect buses found in SM7635 based
> platforms. The topology consists of several NoCs that are controlled by
> a remote processor that collects the aggregated bandwidth for each
> master-slave pairs.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/interconnect/qcom/Kconfig  |    9 +
>  drivers/interconnect/qcom/Makefile |    2 +
>  drivers/interconnect/qcom/sm7635.c | 1554 ++++++++++++++++++++++++++++++++++++
>  drivers/interconnect/qcom/sm7635.h |  130 +++
>  4 files changed, 1695 insertions(+)

Could you please use dynamic IDs? SA8775p driver has been converted
already and I've sent series converting the rest of the RPMh drivers to
dynamic ID allocation.

> 

-- 
With best wishes
Dmitry
