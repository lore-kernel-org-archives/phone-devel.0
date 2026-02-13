Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EF733BBD0
	for <phone-devel@vger.kernel.org>; Fri, 13 Feb 2026 14:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770993207; cv=none; b=R5rJVZP+COMySXMJ5QiF3WI4YZZo9lTqTo/W0ug2ilsaWukQL+XAS47+pNc21nKr9iBtc1lwropqLTXlBsNU6+aFRD5KI0nQq5SlPEZYT6h83DFU5XikibaxscIooq/Oi79kRtRhyeBzsAgu6rcyzlYqxrTG9Lf08WVLMdu2WcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770993207; c=relaxed/simple;
	bh=68E+T3PGFuMWflggEx3SBzlM2xkC04IpzybUwLbDYPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eO8tQime/zxuLInQAHDmc7sW61sny2c1qQMl138EnpeWsx7iFCNl2vnIUhNq5+l0QtIY5RR6UZMbh2tNgIqrHtGJ9NaPj5eZI0wfqsSnLSbInsgBUNRzKuQ7zeI1hOhXrdVu/8fhjbNm0XtzRlUOVZLTkl5HIEMnG3E4x44XRZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L9Q82LAK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=amAie5Q8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L9Q82LAK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="amAie5Q8"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61DC2c79455246
	for <phone-devel@vger.kernel.org>; Fri, 13 Feb 2026 14:33:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tyIzdXSy+XMC6Jjitt8Y+qcd
	oD4cwJ3GMbkRA9cZEwE=; b=L9Q82LAKZRqq2o1ywnWNDX9lZLzdFjx+HCCtXixh
	xtojrADUTjX9kYxtwRD0dVO0YkJNeMMZqmQCJhgZmh4nQiKvFk8q71CftqD13fwb
	NKEOG5buNgNSTt/DqgMtUh7h2g3eZ521hvJbh5JO9OPTg6k+WFERuZhpD1G23unx
	TBYemUlHnyfZjROyucYlbrElYVXMoYQnz3/M2IHtLlr7s7kknBG4Iwj3j1Sa9IDV
	YmfI26fZLPFlG+NnCk1thyacwGTPor6OFngVjaTJhrhKlYte6SzhoJo5IA+IByGq
	L2yoetPFyg4h9E6oLQN8c9reV/W6ZdV1i/p8/hgfq+iyrw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9mev3pyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 13 Feb 2026 14:33:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70e610242so366946485a.2
        for <phone-devel@vger.kernel.org>; Fri, 13 Feb 2026 06:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770993204; x=1771598004; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tyIzdXSy+XMC6Jjitt8Y+qcdoD4cwJ3GMbkRA9cZEwE=;
        b=amAie5Q8WrdUFbnQjns7e6UBCylUnQjPJyNYZZUygdPKt1rmxcXZnPw8CPT89ppgCL
         WMyHf8VnCuTbbZZUaWXwWAXPgeHoR2/uPrK6Dwz9b3SAfr1WJGTOJZXfoM80JCIBNSB4
         3db9NabqAz60KWL97UZju8ePoYzCxwg8kV/sYo73Be+ubPMdKNn3Xku1p8kQK6VqBnPE
         oW8xmIdAH+FKVQ+UcyKSBdc8Ngdw8zbacBN06wpzDRCA6V1Zyj8WfuPsY0Sqea6Y3/vH
         /fMOjYx8+pMlRUU/O1phIVyC5eFKBex+EABd4BCG4yO2kX2aDIm1uAsEgZaDmXE2hxkS
         XRGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770993204; x=1771598004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tyIzdXSy+XMC6Jjitt8Y+qcdoD4cwJ3GMbkRA9cZEwE=;
        b=AhfvcV1i1OMh/R1rwssMLweo4Hi1n2KGJ9K+mq3YrbaXGNGMSpQlVrgckdO0yj307n
         h1PBw1D8UggawTLrAkPcupEyPECkCHJw1iwhO/+r4fjiKwEUWhbBE+vG98fEQmTqd20F
         vOojtfYAr1FIJRKnbgmPRfYW9/dbA/b1Fp5A7lUF+vsg4FPk9DE9pK0VeKKQqYDK2UiA
         50ssohlY3yMfeLkUBftqZYOkpOKDohWwoLvfuOneGZOeRphdt01r4YGAfOSA8GGQXdHI
         5antHB4Kz9kRkcCCGxu0yfnj5O/vNaCofxJF2Icsy+8Fs/KT58SCcRqnte3sKp07jqse
         NI4A==
X-Forwarded-Encrypted: i=1; AJvYcCVaoee0qaOT6NLav2M7ePqvf4mLmAn+e0qtJoXmquj+sYnqkQgzuF4nx/lXCNro6nNt2Ob4lEjhn0sPIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyXLokK6mfC54jDXiU1xSGC9OKRRGLbsX5ATjHsWIpUjNaPEHI
	mBMOrO+c+DF3HMsHjNMtb9JhjDVLfUmeSwfFzzPkdCQ3AZOji2yWfjOF4NSQDCHAkH4fW4Dy/V3
	HK6Q2FuSp0LDzXmD9kguUI5Zj3W7usgKMf3Z3ZMieaAqCIOAx+/zPfjduQmNIPjdyQA==
X-Gm-Gg: AZuq6aKIoCsHbGGuZ3X2ShVu4jTS2JFzMGtF6p5v49gAqf0cG6TIA8eLo9bn5krzHYp
	UsADoE5XnNasecTBMSPTKNO8mudzfXQtjxI8QTk2c4SjefnlOI5rczzbDj/7456JN10c4gZT5X3
	Y4i0N3+IDDUf3duEaYmW/pxKtcHAqcBnBGMEnxmPCpmEs26NLQF7meRI2m7uOFQOHCEw8UmsnWU
	ufqXYc9NYYcaER8X3Q6NYXorsXHSigyBq2pI85KP9VLja54k/7Bh/+Xen0dTTeXpEH/2atnc55/
	qWBFHU48x7fG1oEmEewo3HkGQCobo9oxeOFsH7vRLHKmNO8EOdo9bfTnv7E1YNIY5jWgxC+Z9x7
	GVi9pjHkQRnRNHhSrM7c9MMVoNIIYicndKhzBl7tLX8BNELcWui/xug+FDICiYjJ5SFK0UYPKGm
	26K4pOsAgpuzrwplqnHckW2BHfhKnx1IL0eco=
X-Received: by 2002:a05:620a:3703:b0:8c6:ae3b:e134 with SMTP id af79cd13be357-8cb424c4cd9mr242314185a.90.1770993204376;
        Fri, 13 Feb 2026 06:33:24 -0800 (PST)
X-Received: by 2002:a05:620a:3703:b0:8c6:ae3b:e134 with SMTP id af79cd13be357-8cb424c4cd9mr242307885a.90.1770993203747;
        Fri, 13 Feb 2026 06:33:23 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3870689ccadsm14892281fa.11.2026.02.13.06.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 06:33:23 -0800 (PST)
Date: Fri, 13 Feb 2026 16:33:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: milos-fairphone-fp6: Add Hall
 Effect sensor
Message-ID: <qb3zeuhh5fjteyjy46e3dbsx7ktqvnuh3snqmcvquajdal6igm@fqwv7436yw3m>
References: <20260213-fp6-hall-sensor-v2-1-ecd113d4919c@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213-fp6-hall-sensor-v2-1-ecd113d4919c@fairphone.com>
X-Authority-Analysis: v=2.4 cv=Zq7g6t7G c=1 sm=1 tr=0 ts=698f3635 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=6H0WHjuAAAAA:8 a=Gtky-Hnke50i5UAIlhAA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: 7kRtFCzW2_2S2bi0KfwCJRoOn91VDolA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDExMCBTYWx0ZWRfX5KzJjS4sbLIM
 x34Psm/XOWgUYV90ZUrSCg7OjkBeJZzfeVbWNPlD7JxQyzx8rfyWZuHrIPKThYnM6sAlEXQxKS9
 ukNV6whQKf6YH5lQzUjPCQweaOtcGumAQXStRJGYRa96OFvfSREoQRJ0PN2tRMJPfjE146kuxji
 9h37nEE+mUzd8b0MsQ6VtVzjl/s8ACfjSwHwffLeVEKpy6Glby2bD0/bR0qEDC3Ln2ngzZj8kix
 Bae+Q+OgmAP+rPvmyjIsOp+ReQR5tiY3+s62SIDDcFRofDEy3c/IE4Ji7o2Shu26rpMOAQKPvP/
 /+rqOfYf6uKFrKis5afUzaBk6Omo9z6ZWNsnwQyuboCiauhWOAAMMctNxASbhN9ifGqIANonWTl
 0ty682kTU8+4xfzeVUzA3S/fCPOm/WmXwIh52UldRBb7DzOrqK8Lg6CQiMDvCUU6WESvYF3v6xT
 mTWGY4CBxe7Ea63nBSw==
X-Proofpoint-GUID: 7kRtFCzW2_2S2bi0KfwCJRoOn91VDolA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_03,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602130110

On Fri, Feb 13, 2026 at 03:21:06PM +0100, Luca Weiss wrote:
> Add a node for the Hall Effect sensor, used to detect whether the Flip
> Cover is closed or not.
> 
> The sensor is powered through vreg_l10b, so let's put a
> regulator-always-on on that to make sure the sensor gets power.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> As pointed out in v1, this would preferably go via some vdd-supply to
> gpio-keys, but this support does not exist yet.

This usually means that it can be implemented by the submitter, sorry...

> ---
> Changes in v2:
> - Add pinctrl for gpio70
> - Link to v1: https://lore.kernel.org/r/20260116-fp6-hall-sensor-v1-1-69275c6bd809@fairphone.com
> ---
>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry
