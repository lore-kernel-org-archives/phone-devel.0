Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA593F54BC
	for <phone-devel@vger.kernel.org>; Wed,  1 Apr 2026 13:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775050736; cv=none; b=EkEqIiAOTbV76e+krQuHg8v8O4zP8YaAcI/h79p+ghUmMhNtGKXfyuiQPC/EL0ZnB2OUAwzDuDwrXRuAHve6LCiI6IC2SQHy0fXIGyufYSAIkv08o0FZ6pM9g8XkWy6Zo/4GD5Ft5vYj3ALKFUJVDnk1NEr+4xJixi96NvSUtvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775050736; c=relaxed/simple;
	bh=GVvuJ8D8cdv65MxF/fHzqOyxfS9fjOVlKkEZE7zPtgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q7CSkUO8Im2G59mTWUfdItTlm3Se47HT9WcMTbnCzde5tapTMjdpt4MpmyTx53qotP2hwAn6qcsb09as60sYRsI4wFhI/P3vv5x6C54LC8Wg5vNHUxWBFumlu+GMk/MWJJr5O4c8Sa3mRuh9T5jDBsH7ROrcfqj7CQaeNOpJYqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S/eyAEf2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S7VYNze7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S/eyAEf2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S7VYNze7"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631AvecQ1562598
	for <phone-devel@vger.kernel.org>; Wed, 1 Apr 2026 13:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wPt1hNiW7BQlXFb7+CgzAvyh
	KKCTqI6HWxOYNynNjaA=; b=S/eyAEf2LS6sMOhuXPzKfzAJDuCaV9Yj3bDQ60QE
	qM1WQq+y3uVLZcEMmcqWHkSL+RjyHhLXBkvzixdqMPhB3H4lsrXPow2zE77uh9K1
	gdMdb/ePJPJqOw1uzf1XCmG+KnOpI7Gho6QTVh7xjViRsAJuvwLp9OxjMxW/rbIr
	FqXerEsT+o27IzDct2BICqxOMAjbVONBJyx2V1pTKq0c4CCMHzsc7zYpnDDNoy/v
	3webJe+YP8YUrZSE5CJOPRYwmj8r7/LcAuTtn2uXuvJH8nrnbxqKFgBiCydwe0su
	4UaPFVqSfOQhR3vsneO+kdT4eB14KaiabBN8IHYV3hi83g==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8va3t5hn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 01 Apr 2026 13:38:54 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6054a46d802so4317021137.0
        for <phone-devel@vger.kernel.org>; Wed, 01 Apr 2026 06:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775050733; x=1775655533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wPt1hNiW7BQlXFb7+CgzAvyhKKCTqI6HWxOYNynNjaA=;
        b=S7VYNze7USisDXvuRix75dav6U75ev44ciDMJDXqfYE/Hox2H37ZbnptS73HknN5Xh
         ainC92TulXnbba5AiGimRV0T3DBYEF8NLSrWvoQfyiGQvx+RTRM4jvbu3OYNlBNhgnvT
         lRn7OTaTYHE9k50PYdovx0zebkdF+B38M1cuYp7bax+C0rN0NJiAzDfUl3XnOp6huLd1
         hAB3CrWl1qSzxZKFsEpHKBEXn1SUC19ombh8LSOMFkufg0ChJJkaq+w+cDERYFoCl453
         xfuZwJvV5O/9yef9GkCKVdEn1G6Yp7pioJxOTJpvCShRndM6CO2qVlPwMuUcJN9mEt7P
         8WLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775050733; x=1775655533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wPt1hNiW7BQlXFb7+CgzAvyhKKCTqI6HWxOYNynNjaA=;
        b=WSdBT1rjgG/Rg7VXPcrkl4wGzUDJOZ7iq2OVeUO4JCol2QhCxC8qiXPixAFtV50Ecg
         s0cJi6vQDoWWMARaWlIl+sg5DWvBePbNazsRuZLsMEJTsVwUrFeTXCMj1O6ds6uLaSqd
         LW1BWEStU/shWNCWGf1EEC3sLpYRoNJ6MzhESr5+Nm77CQnwq09Vm3txCRNbSlvFuxbg
         G9PrjWirdVJPX5Q2brrw83O2p/bDXLO40ccMm9+hk1eacQVLvif4xfc5QK8oQZlaNEvG
         Z9YDvEts6hFqw4Lm0Ot/jmtwHVX0AHr8Y2yCWoMCz93rKwP7wERCPaHOzY2zJIyoWB0Z
         DIWA==
X-Forwarded-Encrypted: i=1; AJvYcCXuQTGTEm7+d+N3o9519m7/UR0sbKUrUGN3TLFw1CQhWGnyQcXq8ckABLHb1ExFwXr3I5sqm2SpX5Qtzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxX3a0WaHYWFSe6HRRGZeZLSF3aU1m7+WXWOo9vrWnnD+bY3FHf
	YElpxua9rFIQvhtjQG0nR/DzgpfnFmIFAst2Oc96gikNOpP0+J6WTSLZ6r/EyRNU7uOlRqLFqOB
	5RpPu/VJmAQZY2Nx2RHN4lh7aWHCk8T4X5sa8cDAwnjUTFGoU/U4h2oM4uf9fBLLezQ==
X-Gm-Gg: ATEYQzy0bLRuVAHjOlG4QGuF+QGPoCsE4TXTXsm1bq84YiUyus1pQUYbK2ZoAf91swM
	sEDVwR1pfgFxq5IBMK1CeHPMYRL5gO6fTlv8+52uBRtLxxukd4RW/CcA+RV+I1HNv9aLJ/nvEcO
	Idts/JKXyIjbcL0MGcI3FFdNr9/FGWqZkHiJfpCh4CmBY1+FweQqsX18j3YFLHKP7tfJi5W+opS
	ZC777P9VgkRxVo+sxipjamS0Pc3awZjUE+/YwKlIoUuxF1XQU3bCBw651b13P1QlM6B2EWMBw2M
	C2C3LnHGCijlkr5F3VtYTuq2LXX8YMiaoeuQQtBvN1MI/6QHcQe9BXYXu78EsQxzC7PeTW8V72t
	yax2VSqhWW9fA9CblqT0QvzlN2R0s2Zenc6QYSxhc0FDPNY1BHedgdXF2HEKsI/wfqOZJMPIEFQ
	e2ECk8KbFKBL6Bhtvyc2lA9/PIYs7qZxCXgII=
X-Received: by 2002:a05:6102:6897:b0:602:ac40:96ac with SMTP id ada2fe7eead31-605681ab78cmr1258683137.26.1775050733548;
        Wed, 01 Apr 2026 06:38:53 -0700 (PDT)
X-Received: by 2002:a05:6102:6897:b0:602:ac40:96ac with SMTP id ada2fe7eead31-605681ab78cmr1258668137.26.1775050733109;
        Wed, 01 Apr 2026 06:38:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c8389202asm29339891fa.24.2026.04.01.06.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 06:38:52 -0700 (PDT)
Date: Wed, 1 Apr 2026 16:38:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 13/15] arm64: dts: qcom: sdm845-lg-common: Add camera
 flash
Message-ID: <itxk7g7azjbbj5o3gexf3ljnhgrvuh5ilwef2ur2lzu577nexc@fkzusg5k6pyb>
References: <20260331-judyln-dts-v7-0-fbbc4b7cc557@postmarketos.org>
 <20260331-judyln-dts-v7-13-fbbc4b7cc557@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331-judyln-dts-v7-13-fbbc4b7cc557@postmarketos.org>
X-Proofpoint-GUID: Nl5VVIn5-rf4T1tWTsovDnaXmN_ZY8UD
X-Proofpoint-ORIG-GUID: Nl5VVIn5-rf4T1tWTsovDnaXmN_ZY8UD
X-Authority-Analysis: v=2.4 cv=B/C0EetM c=1 sm=1 tr=0 ts=69cd1fee cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=Gbw9aFdXAAAA:8 a=R5WB9BNycgz1ABFPbbMA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEyNiBTYWx0ZWRfXxNtCYg9o9okk
 yAb3AVDZaLptUZ0oMJ7moUreYBpOPlbWpfjRrkFHMpVmvCms+kGAlZLQGJZAja/IeAY8+3IhC4c
 xaBMkd66XoknIsP9QdmskM8A95ENv4+yZl6qDKawe3PA7X+44L4i7SosJwZIs0Mbf79YEI89JHj
 qbqMgHp/eRkaOs+aUV3YvVdd18zsp9GmZtn4mwRwUUF82q/mljbJB6/7/4jGkxvvlpN0U9Tx709
 nSSjQrVPdibd/kDnxcbZK5kFhnNCZmHJcjnJf3tRlu+/O2PPrYvTyrFCZNMRF/kR3gaikqXAbCB
 DxaDUXN+1IZsQKgAtNdIfaQYilx1HZ4XA31egkjyzvuy3Oc0QRNSz3QTrUjJN8aEXqHq1RBX7Bv
 MFG2G9lbg5AWQEGQzE03LyHZpXHm6onPkQyavwPMk1wSFOFsfYnHaWl9GBM9p/EL5Ba4mKsn4e7
 ZMWW585+OAba/XbrpSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010126

On Tue, Mar 31, 2026 at 08:22:18PM -0700, Paul Sajna wrote:
> Camera doesn't work yet (imx351), but we can use the flash as a flashlight.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
