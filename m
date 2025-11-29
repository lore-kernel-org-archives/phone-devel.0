Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABDB19D081
	for <phone-devel@vger.kernel.org>; Sat, 29 Nov 2025 01:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764379249; cv=none; b=e/7eaaiiXS7w5hRYpYS1MdsFKOEhg629qADY3FnJoEYe4nM5tuiKf/j/sF0IFD13U8VOkE+QU0V5rYkA+OIWebaxzRW6U8dieKS81xhnk2J90aJutLAy2J0r7gHiACq9kRegvTZ+R8CzhZSXtxjsECT7zY+1KRxD0RyLUKsBKyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764379249; c=relaxed/simple;
	bh=V8g8Ye7BpiYchokhruXJxJQ3o3KlxGYU5pAVE9dIcSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IehZnqpXMPlX3Se4o4N6Ag1WVizaDXvej1p0UzHex592H5uI7MskOEJOmyyu+kIJ+Ru3XoPQrTokKyEGGBnLdxyj0ivd1jcKlnRQnRpCaTxK5YlYTTH+R4mUbQBZdMwn3uSnIeWRHuMUJhzMfGYgNdUPI2/G+xwziRVfWvxFHGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QyHICbGV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=evtrxAKu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QyHICbGV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="evtrxAKu"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ASH2hVW838632
	for <phone-devel@vger.kernel.org>; Sat, 29 Nov 2025 01:20:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lvklgFNQZLlZfz89XYOjAPU8
	PUVJC+ts+824a0ZSyGw=; b=QyHICbGVHFozecjVxf1gLOLAEFBgzdh47peX8XdK
	ZQm5tNE/leSLt7rbZ1OyqKvXhzGWB75DK2B3JxB6jvE7lIlK6MMQ859Q19XW136X
	ruhfSysgtg0lwowFJqPZuHF+AtIN2wNVKaFeZdKIgB3oE8YdBcXNqVCRd9WabKFb
	D7CyafENsy2YNGB2vYbGLHTfN62KgfLphLZ2F1G5alIJjJzFyp+wfWgvMyWx1eZp
	DALdPveUQHvv1puEfQRX2xe1zHggyANKMiJUQxVsUm55Qur7627FV0Y8jb6kvT7O
	1wTen01PsgQDzyx5AIIJziOh0EkdPGik6vzdVPkzkuv3Uw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aq8mm9yfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 29 Nov 2025 01:20:45 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88041f9e686so59648826d6.1
        for <phone-devel@vger.kernel.org>; Fri, 28 Nov 2025 17:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764379245; x=1764984045; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lvklgFNQZLlZfz89XYOjAPU8PUVJC+ts+824a0ZSyGw=;
        b=evtrxAKuEUV3HRu9VHARQyCxz2leygukcjaw0mICyVP/Nr1XCoc2F/l4s6P52KUw6a
         3B9QLGQXPWplAPLRYc9oZ8x/2HybxXQUMLQaasgkiWwcZJLrh9jfYdOHXIByAA3kbioI
         OSkoin4/f7gVK3kVM3iDSB/IZBB2QcTDm0WVboMLPGAlzAqbSvt0rfbYe8yuRucfPbba
         XvscaU+5RmuSD6Ps1Tar2TCIjOj6nmhGSUgTVqFZ2/UCv6EqL1b3ds/xBfPG97tPJetj
         KgYERmbpMkbV4Z5uwIE9kaWcjtqVmZxK8osPb05IOcQoR6xT3JjEpCkooowXzFajHE1Y
         jLYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764379245; x=1764984045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvklgFNQZLlZfz89XYOjAPU8PUVJC+ts+824a0ZSyGw=;
        b=cwaBH2Go9mmBXVUhk/zz+DSr2PNG82k8CpSJhBsj+s2vJtnB4lAuOg7Ayl6El3uimE
         xwzPQe14K5rL619PlpuQUn1bEZ4v8n2YB79cfgXuV9ry9cRyifclwVZUHhzbpVWTE6i7
         14fukXgj4eEzBD/X5woW3yxi1Cx1E2KqI6fWMVXC9DnCNXLu8FU09fmaN5JJr0iY4ynh
         KIjm6XA/tu2NKotEf29SyZopx2t3AWWm4bxfReWeoU/pXSLs7XSGSCN3W8HMrmQ4T6Qu
         qaLgkwMxVM2q7FQgUguVPApdDCA3k6pdAoBxV4taeJ1gjU54OiXhBtGuhmhPbNElCEsF
         zopg==
X-Forwarded-Encrypted: i=1; AJvYcCWUySmyK96UdRO/8sW8YXUKfWQps9NSL2BWEEXJQxzoTtSnSpJFVtDeWx7tYn7pF4Ia/xtO6YW+pX9rzA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8GfJ5/YEKHics9a6RZZDUZmGnzy9HuZidL9K87JDzHVx6r7RT
	La0nDw6wbeJMFr/pUFM8iMgkSAg51fr4mYVemRHa1GdW9xFvFei6thP23RT7V9bESp5nfgsEVDg
	PQSdTEhgCmDwfBkp2LU0hzlyz+SuTGqIiboIOEGkby/HIdIzVb4RPH6RhdagB6lYdTQ==
X-Gm-Gg: ASbGncs7qX25G6dI8OazVjWA1JodZBm+sAHgf9t11ixuCHPKzi7gBKxtJgYDu60nl6j
	+8BC4QQVtnAVHhE1Mp/DPzfdQk3NQw0jZGqlFUfuLhuE64o2zBIMJkKnaYHAr1DIRPqnfpzZuMP
	NZmYtOP2rQkfLfIaYFawyCz5VQEMKzTWCaOHmSsxUw3ssDRa/kkTquX+kza6SKCWF1iLK0cIAhb
	xdnIKmggDPgHQGoqqkotPstDPxRLep8wWOjekZIjPlcZmKYHzs4JyH5gMSYO2lr/dg79DRDeEHZ
	o2y+WH2tml4G/2JWlrQJ0/MAM5Nnmmu1wELM/BCka4Nzr1CxGUtqFmXAAdLpmj/Xbcz4jzINhF5
	pReFO+RXnhGXlyxzSxlI4T76PAXCGmWDTVUCT1bHqv0zyIfDmPWGT3o3/pLMmHsYf01d+mgjQXU
	96DOV+ZdKBJUQ4UOR5ycBrLTY=
X-Received: by 2002:a05:6214:3204:b0:880:57cc:7a96 with SMTP id 6a1803df08f44-8863b049bddmr259351616d6.48.1764379245001;
        Fri, 28 Nov 2025 17:20:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHgnFKXUxUYneu8X0dcuQO2AcdSGm+qZ3jZQ/QDnwx3rQYfGn1v+x53Rha/yqf2jNAmq8v0+w==
X-Received: by 2002:a05:6214:3204:b0:880:57cc:7a96 with SMTP id 6a1803df08f44-8863b049bddmr259351276d6.48.1764379244615;
        Fri, 28 Nov 2025 17:20:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37d236dd67bsm13256611fa.14.2025.11.28.17.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 17:20:42 -0800 (PST)
Date: Sat, 29 Nov 2025 03:20:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: longnoserob@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm845-xiaomi-beryllium: Add
 placeholders and sort
Message-ID: <3xg3mhkpde44yg5pu6bulmyae32pf7khua236tfeu75vf2p3ib@6jifxn5l55ox>
References: <20251126-slpi-v1-0-c101d08beaf2@gmail.com>
 <20251126-slpi-v1-2-c101d08beaf2@gmail.com>
 <f7bfaec8-cb98-4254-9779-dc48a9409bb5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7bfaec8-cb98-4254-9779-dc48a9409bb5@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: _iadfvFP5pm8DRhAK1OD8Cbb-4hk32A4
X-Proofpoint-GUID: _iadfvFP5pm8DRhAK1OD8Cbb-4hk32A4
X-Authority-Analysis: v=2.4 cv=Cvqys34D c=1 sm=1 tr=0 ts=692a4a6d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=sT-A7VFY-dxTl-lSRN0A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAwOCBTYWx0ZWRfX9WHSHVGZSvzr
 UFXCQUS/xU+DGbKZ8OsCjFHiaHfBQWOW/bmo8RDYOyx4N4L7vkLUJ0qvs+3Pb6AYzYVpfmRSKTg
 jJTpt5L/Rqx5sTOGUaI/qmmprBAjURCsNpnE5tK3GbyWtGpKSfvMb/JHXVF/VfCpz1dgpzWiwbO
 3+KnUGCUe9qntaglHXmnVvLRIuIW0HlSmtpcHffkROKRiS7PZ2pUioNK61jnGaEoWHeBduJYpbg
 4uglTMDEkZNPHAVrEIPZqhNezG+L6DnyhWspVKdSyPaQZWR4TMt0m9CresFAxJzdZ+mwabSEjqa
 UQlbThcsZlHOzL5yh7tmpmkCBf96KYKl0Xg1eqCC0ZfFlP3ZRxDxhofKU4o5aApoVI9Ej2Q5YyN
 r3Py6joqoDB3glRvP91+1l3ZpA3Xqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511290008

On Thu, Nov 27, 2025 at 11:33:40AM +0100, Konrad Dybcio wrote:
> On 11/26/25 1:08 PM, Robert Eckelmann via B4 Relay wrote:
> > From: Robert Eckelmann <longnoserob@gmail.com>
> > 
> > We know these devices are present, most of them are supported by
> > downstream and close to the mainline kernels.
> > 
> > This is very handy when rebasing the integration tree with the support.
> > 
> > No functional changes.
> > 
> > Signed-off-by: Robert Eckelmann <longnoserob@gmail.com>
> > ---
> >  .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   | 23 +++++++++++++++-------
> >  1 file changed, 16 insertions(+), 7 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> > index 0fb1d7e724c4..0b219d0ff451 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> > @@ -227,6 +227,10 @@ vreg_l26a_1p2: ldo26 {
> >  	};
> >  };
> >  
> > +&cci_i2c0 {
> > +	/* IMX363 @ 10 */
> 
> It may be useful for you to add 'status = "okay"' here, so that the busses
> are accessible, and you can poke at the device with e.g. i2c-tools

And a bus frequency then.

> 
> Konrad

-- 
With best wishes
Dmitry
