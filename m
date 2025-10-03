Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E25253B66
	for <phone-devel@vger.kernel.org>; Fri,  3 Oct 2025 21:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759527064; cv=none; b=fS5tmIuj8qlqo9RU+lbOCQimiTGsC9aHT0T/fcGFbCAoeIsyAE21G8DMgvUn+noVucL6Np0ceYUkJ7r0EVDAFAL2sEtwAGAP8oCXLONxI5/gIILxDhhCIcgousBH2CCvvtAAx7+UhhXjK7FeH/aXl4A6mL/kESfa5hHHdesMTb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759527064; c=relaxed/simple;
	bh=fq/fY6JqxN6dNqCJ5P8kQFzhneXSbn5maPTRGVNN67o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SbkKk8m2bzyhgP9pmwNwuVWXMv//TRfhtzXezTcVgzmSbmOOeEm1d1gjOl+5heJWJFUrA11uoekYQAUCpih+OgzWvTcfIpBP+dydZ3z3GQ0If3Ov82B9kvEXsjPUoGTiBiGBslZ3aV1Zto7oVPQtnNR0VLpla/DTwYgbEivScy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BQvBvPjc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BQvBvPjc"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593IMEIL008063
	for <phone-devel@vger.kernel.org>; Fri, 3 Oct 2025 21:31:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=53GD0wKdX2v1xIpZL/WLa0QS
	fyyHKKezHxL8P/DVLl0=; b=BQvBvPjcO2pKigMd5bMO6BPzrdB4vVM4zW7/pVs4
	eEOVd45pngf6L5dByrIbvmnYYDqXDHHbob1Ea2lfz4gjF08X+bgd+xDEpc8aQxvW
	G5iKWvR8BrUOqPeEoj3hF4OT1Ep9DIhAaIcOx3lPBtwg8t0QsYm2X0yWlwgDEAel
	uHCHq8Nn5SdQupzYVcbwm8RT0JGepSPj4W0VD/Vu2jJ2C+bSpAfchbcPTiSlTTds
	GztC5pmQ1N3A7ZEHI2NjHNse4/5NiAqZ1tCH6q4FtOb0ugjplakhftzV12GjhNne
	McRK0vfLoS3l9i4yG6CPH9/IHNPL6hmv4PPWIE5+3Jc4VA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49hkhh56aa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 03 Oct 2025 21:31:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4de35879e7dso15265741cf.0
        for <phone-devel@vger.kernel.org>; Fri, 03 Oct 2025 14:31:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759527060; x=1760131860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=53GD0wKdX2v1xIpZL/WLa0QSfyyHKKezHxL8P/DVLl0=;
        b=Qubzrcq95KHXc3ZYVVOtyQbD/pjvxX4mnMx2Vn7Cez+59WkklCsziCMuRhTy+kmwpW
         hodpWo+19Cl6U6JZ60lOmWOci65AogU8Aa1odYgc6AuVd8T2YyUhTI9VQu3gQXXL1IGz
         sgeTeAcDyIfEejxNTox1f22/ml2/MiYr2Abhamoy59AnYfoQwOoIY000TtvVqYsFeJFT
         5Zc2uyHyeBCqcxqymLorT06p35Of6yiDEW8Gy+fLyqDnDuz7ZATTU4nDYUa6T9+UVy1e
         wmZqmzmAVUWFGUtLmvXFJvuWJzNu18ySx4CwMhXS5dSP06ghOeuTpF2mSuXlJwygZaBz
         dRgA==
X-Forwarded-Encrypted: i=1; AJvYcCX0litE5srEgiFCUZ1DXOD6f4O3QB8dIU2g8cMjqxM1f2xjzL4w6pUqhchHve5tpjhYxlQEgrol0DwO9g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/IooYx0GvBjNg7jQWnWRL0z4vxnkXjF1z59Sb3kV4qt+by+e+
	wI0dqNRYxRLp1ZU/DlbGT1U5gLhl7w/lPZ7Ar0HNe4Hg9EPhyckxaNJaiAwk+lIu+YXBhX5tahW
	b+m9AuH52pq2gz6TqiiORiSKb97vNlbrPZ/luiHTx7xP8f5gYUd+tBEq/pyCeqVlW3A==
X-Gm-Gg: ASbGnctUTAcJP/zrm8K+m8bmSaj53cRDn14Eom53y1fT4ogDsYBBPQlmEKXftwds6Kb
	SGIige92fDQ7HSHkZF0rhRQm917Q68H8W2Dds39qVRq6J1qHwkwM7t69ED1KeXCMr68GkqwEO+8
	6c4KlAjVTilSRPeKBRVBg1Z20EwhBOvCQFmSw0TdSGCT9F39zLg38N/waUCMU2uRICiWJHBd2wk
	Lk7AxUueeH/NbPKXuEj29MVUxMll26HRONDHbEpnaBKKXuI65FPff+uNq9helfOQrB672nM9Psb
	eB+EFbQ4nyatmIS3GKmDB/s7k8W4Lk48bIMHwimegjyB/Ig68W6l69/PLmYI6I5yyvxt4Gw+fp0
	+ZTNDOUuGVbUc/tbwZPwfoq1HjxPhZev92VCV3IWW6IrLbo7T5Mi3y3Qnog==
X-Received: by 2002:a05:622a:5c99:b0:4b7:9ce0:43c4 with SMTP id d75a77b69052e-4e576a453eemr60116121cf.5.1759527060090;
        Fri, 03 Oct 2025 14:31:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbWgg1m6ArZd6deTxtHGQP9AEmpq7RXsHx30Vj5OcL3B8xyMb602ba9wWnqn1h9OZ2s/kPsw==
X-Received: by 2002:a05:622a:5c99:b0:4b7:9ce0:43c4 with SMTP id d75a77b69052e-4e576a453eemr60115521cf.5.1759527059351;
        Fri, 03 Oct 2025 14:30:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d6e6sm2175292e87.78.2025.10.03.14.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 14:30:56 -0700 (PDT)
Date: Sat, 4 Oct 2025 00:30:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v3 02/11] arm64: dts: qcom: sdm845-lg-common: Add uarts
 and Bluetooth
Message-ID: <qg4rlyl3gqlkih7sssixi6sfvdrkreoaz247ckmbja4zkybxt5@vkfvvhmce4kj>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-2-b14cf9e9a928@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250928-judyln-dts-v3-2-b14cf9e9a928@postmarketos.org>
X-Proofpoint-GUID: RVt44l00JKdVXnQnWFiDKJ7z9yiONs3B
X-Authority-Analysis: v=2.4 cv=cILtc1eN c=1 sm=1 tr=0 ts=68e04095 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=Mq719mGqAAAA:8 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8
 a=8yVOI8cEZPrke_ejmRoA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=gOTWM5O2Sh7P_NUuVqe5:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDAyMDA0NyBTYWx0ZWRfX3G7CrKQLoRyb
 5PcF/LdGJ4QYWzBil/yy/CEJE2bin3EPz8NC9X6kr5lAPy8NmCWk5Olz1gwofyF7fjU6yScxu7e
 822XCmWah7Jta4kBB778wIUnGcERv5r2uyZD1taLu7IR9ZeGd4V9VRHIlSLbTqWLaQqolUST96C
 eMqedZBEiMVNwutvWqRzSiWt6akBfeEwxzOxhrVsr4MREeHtkzWNV5pSK9o3TX6WdrV0EraD0pD
 3mtKs8RSVzHkoOUUupCT5u6ej1eXFTgQj+I6iMtlI0KqdMGgf9UC9uU2K/1A0M3pvjnBBHowFDC
 OhbRyAwWMHybyzmPJIjKXxJ0cIT/UuNaGC6nhE8/Z+h24u2OZnwG21GF+fCP8ek1g+JVO/aN8mG
 t30G3oh8qT49Z/AA+sfCEycNgliV3w==
X-Proofpoint-ORIG-GUID: RVt44l00JKdVXnQnWFiDKJ7z9yiONs3B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510020047

On Sun, Sep 28, 2025 at 10:05:25PM -0700, Paul Sajna wrote:
> uart9 is debug serial on USB SBU1/2
> 
> UART RX is SBU1 and UART TX is SBU2 of the USB-C port).
> 1.8V Logic Level
> Tested using pololu usb07a https://www.pololu.com/product/2585
> and CH340 USB-UART
> 
> uart6 is bluetooth
> 
> Add bluetooth firmware path
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>

If the series get resent, could you please add the boot messages from
the bluetooth (hci0)?

The patch itself:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 45 ++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  |  8 +++++
>  2 files changed, 53 insertions(+)
> 
-- 
With best wishes
Dmitry
