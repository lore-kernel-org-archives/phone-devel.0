Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB9A326924
	for <phone-devel@vger.kernel.org>; Wed,  3 Jun 2026 13:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492773; cv=none; b=pWzg0MHz10BDXZXJ33our1ai751gOhduRdYrDjJy5O93tPewtXhiZ1kLmgZEVlQYL2SkK80tEs03/tv7KDJISTk8CzCG9Qzj6GNQk6SDoVKy3ZoLFLrsimzlHFQMoZYS2NObWVF+Nk+9zTh/ikWBfGl1gMd8r8xwt0Vzw/gjSnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492773; c=relaxed/simple;
	bh=1nBMSmHkUb3Jkq9JMXc+5j0fs9PgAQlDAMdQSLgzC2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oRMhdkOMujoKAeWJkQ5WKM8LwkuXHzNDjzimYCK3dbieaUuEWgCdyWpe60cCU0SnGdCzLQ5D/gd+5YJM9knDHOxxEg/qniSCw/kDfXmlyC2oUTVnbWncvBSAzSEW7/Phly+AdP6DOPYUwO1UruvFkyyjC5pG1MFRqhU3+W2aBYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aIG5ks45; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cei4H35T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aIG5ks45";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cei4H35T"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653CDm7r1200157
	for <phone-devel@vger.kernel.org>; Wed, 3 Jun 2026 13:19:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZQM1x4Esz4yRdbII/P6eIDfx
	ohTjz68+7v0muOP15vI=; b=aIG5ks45N2mu/zbkGH1OWKWZrUSRPGfglAxBph1O
	N8eAVRUeYqEK4rzaIELDKoX++7MJL8iXsmufopxacx2HgBBiklHaXsapgrlEsaWn
	G9z1nEZh1zbAvUVE/4n/oxBNA+5H5AhrOGjQz5g9u24yzBFv5NDeqyBFqM/MkrrM
	N9WAs/DAP7xWnzGRAQGg/pCIWO5TaPEnOO7HQ+VmtS0EKmnGV35iXkiz3nb1Wxrk
	jDMgo2aRx9PqYV5oV2UabtP1laYDh4gbWLV1n+QsXrmj/01TNEJdeRpSu+W65C2s
	lv6jnttT/K4Q0XfFeWkfSRKVoROFz7c3rNxaKoDRnFIwzg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejckw25y9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 03 Jun 2026 13:19:31 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9639d763d99so1739894241.1
        for <phone-devel@vger.kernel.org>; Wed, 03 Jun 2026 06:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780492770; x=1781097570; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQM1x4Esz4yRdbII/P6eIDfxohTjz68+7v0muOP15vI=;
        b=Cei4H35Tx/cYUB4GJe/dKLDj0ZM2hRKbwXI0O50hiQUOnRUQNv/HG/mfpTgsb7ZFAh
         bUrAMOK8tfAYj5axon2EcIQvRjEc8sHigMLJNEEmI3DiUV8DxFrmtptD+hYV321kTpqo
         nwPjdTP8+Un5+KHbeU0/JRESfZ4nfKYDRzxi/P4OcEg2cpycCcj5GsKAvHcOdsLCOulD
         xLf2UD9O4+wOxS+MnrjkruqYuKwhPBZeA5ZHTZ0Eo7pAgt47+YyyF8vizQwgHlePjm9V
         YXACtaMeKM6yvDtZxwluACS/EZD4/bJlft2FTHhFahtvqqViGRkj6FgkiN+LMVUEZaAy
         wQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492770; x=1781097570;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZQM1x4Esz4yRdbII/P6eIDfxohTjz68+7v0muOP15vI=;
        b=gPVoUntIBzGVRh2rbDbWHWt/mUa5oyAmFycwthUp5C+uTqwngfND6hbyT2wopJnDZ1
         BUvJPzjCQnvpFIc1HRxLKyvgsZE9oVkFpbTW6O8klGr1LZgSGPo3PdEjlFdZOymqOPbH
         vEiJhG3Yq2ahhLBScjJV+6EPNX5sxgn1bQdXD+izdiJu3DCQ0jZmrxkX/OJUn01yFm+I
         qWUiMBFDePLbc/JAehyFuUx8i0moJU95VL8SHtiWzHdnh+FFv1ncr3be2dqxTHlfNXmO
         MC9qR44fXnjyHc4MnlKhuPEbusPQGdpl216kkZnhr82DLnCbN0dRE7yRz+wRUNJbNKe/
         wpEw==
X-Forwarded-Encrypted: i=1; AFNElJ+dboD7J9XP9/hwdcxSF0FllyHc7atwztdWxB3u++SIjILU+Kon1/7uM6W2ec+QtHuDs1/fu+cBCos4DA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIjC96p1KKHwsOrtT2h1hW8UAeITfa6t/kyHCbpA2k35XucOd5
	Z/OqzFsDht76ALRyMir7IaX43GXZyyfBklrFF5KuI5C83XVGNQ1MwNKXBu3GZGMud1BoHOeb8U6
	TofyndALqQP6+SZem/F3WLtQUXwq6D33iRtUgfeXeU7B9W21WhJvdZLGMrSnMmZ83Fw==
X-Gm-Gg: Acq92OGV8qYCCcTGjopTJTeXs83lg/MD5e641b23ju3Jv2FrQVUVLbM+yNrsKDHc5mH
	hYDh1EW2he4dgsyR+766ro3gfdVEHWG5Vo/J0RpvUhXLaqQIJOAK0imBpK4FNsDDvSwKUlnO0KK
	yaSrX5bLgQlXQMC0AcGMv7NvrsP7qgWMvnRFZMejHsK6UaRrHMEg1vDLBCzjm+UYuBe8kKlqXeP
	kKHgkKXJJlIjNz/Wav9JAua8bY/mi413X+jJXTl5g/xXbAgc8/hWFhcNzfp5qWQlMSugYA8IiYj
	yG5KgiAIg5jITCBS+e1hY92pQcNBtj39Fu4X189TpabZ72j8D1Jt1ygMZ0ns5dStoBAsEFwABAs
	7go3rD18CyPgO2VDuMgbon5xzEcdNpfFSKZa1az1ylRVcGlsszyBGGAkjNKZ+cEPsj1tvCOrs9g
	B3mHo1Th57GLaYvyGfKeGCgZYsYA4NVjPbCWUAn+on9lIsEQ==
X-Received: by 2002:a05:6102:9d3:b0:631:2f82:c3ce with SMTP id ada2fe7eead31-6ec2b92f476mr1386574137.10.1780492770616;
        Wed, 03 Jun 2026 06:19:30 -0700 (PDT)
X-Received: by 2002:a05:6102:9d3:b0:631:2f82:c3ce with SMTP id ada2fe7eead31-6ec2b92f476mr1386534137.10.1780492770149;
        Wed, 03 Jun 2026 06:19:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396abf678d7sm9164781fa.7.2026.06.03.06.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:19:29 -0700 (PDT)
Date: Wed, 3 Jun 2026 16:19:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: MINETTE Alexandre <contact@alex-min.fr>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 7/8] ARM: dts: qcom: pm8921: Add USB ID extcon
Message-ID: <xklnqbeuf4gblh3l57cfpd2xchfy3rug7b37f4redumfsl4g52@dh57ssbrhaz3>
References: <20260427-mainline-send-v1-sending-v2-0-dcaa9178007b@alex-min.fr>
 <20260427-mainline-send-v1-sending-v2-7-dcaa9178007b@alex-min.fr>
 <20260428-jumping-discerning-oarfish-d2caf1@quoll>
 <50c433df-d737-45da-93dc-76d365052a6c@app.fastmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50c433df-d737-45da-93dc-76d365052a6c@app.fastmail.com>
X-Proofpoint-ORIG-GUID: M6o3497ZlHmy8EkM9TOZSFHjuKThzG9S
X-Authority-Analysis: v=2.4 cv=edUNubEH c=1 sm=1 tr=0 ts=6a2029e3 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=AvYuMi_7Bs4finmeaUUA:9
 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEyNyBTYWx0ZWRfXyZqrwKZB+Q8M
 Ylug5wRgmRGYWkqNZrRftiHzVV8S3F7+NOUXFX55hJ9rRzzK1M8HC1BSuWt0XfHZUU0rKPqG6ax
 foKNxThEIqisDD0ujeTHIHQ/TRQO+SkpqZ3vyfP163kn5Jkwr24Wqr+LKmd+yf3nIrqxaYX2Qdw
 Apl6y6fZPJXS31Nr1WEIIBVjaAN7Erbys4vgnWbICmr9ahmIfDTP36JHhFxhjIio+PBrRtrijeq
 wiqOsUjDHtazPvqlXXaTfo6robK5txbqObeJw2lmM5G4YfbFDiciSxdH4AbihAKR7ULpO+GYxDa
 fVMbecfafEApX0ThgAXGY2LUcOtmjH/wTT1pT7SPaEX1HVyS+g2UKPNspTzIKCfQfTBLjx0a0TW
 JO/jYUDJfk4Jp9/mLM0NllrGk40T1vBX4v0Pu4BRBpe8OCXngymtNwSx3R3RW34qkizPlDuOCdn
 FLSWMPg3iL38tTCDS6Q==
X-Proofpoint-GUID: M6o3497ZlHmy8EkM9TOZSFHjuKThzG9S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030127

On Wed, Jun 03, 2026 at 10:39:24AM +0200, MINETTE Alexandre wrote:
> Thanks for the feedback, Krzysztof.
> 
> Do you mean that the PM8921 USB ID handling should be exposed by the
> PM8921 parent node itself, so USB consumers would reference the PMIC
> directly, e.g.:

Please stop top-posting. Post your replies under the phrase you are
responding to.

> 

-- 
With best wishes
Dmitry
