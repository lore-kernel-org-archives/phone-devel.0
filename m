Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AAC241663
	for <phone-devel@vger.kernel.org>; Wed,  1 Oct 2025 09:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759310052; cv=none; b=VUcI8FNr1J7BVZ+EZ6yDLmGbbgJQgbiV8kKztq5ggPhQp1yk8qUJHZb+VLGWnyVWuClQX6pBY4OtPQOHq56hO1GiQ1wYkG1fBbihOTyh+xynjv+8kEzKcVIS4NiZcXVqPBfzBQy1ONBXnJQWa4KmMKb+bKChAUMU8GYYQMCKKlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759310052; c=relaxed/simple;
	bh=DiKOiuOUrDOlbJnzJU/h1DMix21rOvJ9MIGTIzcCuLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GFOo/2W/avyF5UeTCqScm+Ebu+nwPuay9VJeK5qt+HL18a3bUNIemIvmd0ppJ65lLdCszCCa9t1YCM0+Cl5T1bp6kQlBxG3SkDTdMJIZguGp2yponTwwhPTWWsNEBpd1lENJ8+NA10iUGGybgtRghb3h+Ic2UIsQtin9yhZdG1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q3Bk/+Rj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q3Bk/+Rj"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5917KmbF021268
	for <phone-devel@vger.kernel.org>; Wed, 1 Oct 2025 09:14:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rn3/KCzj9e9RYjWV5CHIU+LrVXqFk2tQ42l7zJWamMo=; b=Q3Bk/+RjjREsrk/n
	MEw4NpcMDm9AtkNhRFcdtGRhaNPoiW58Y2CsOIXdZwQgBPcElLBOZKWBfetz5lGS
	EFeWgPAVpkNkGheylbMm3NJ37nOgapyxnbVoM4iM3B6YGizuaiH5wiIAP1KEAie1
	f3WvUvy7rJrs16gNLGzhemDPY1GfrdW3bOBn5Ga6ubhlhiFznrMATfA++Vo0ybek
	D8SpCQ8V92Xm0VW4w7gnvx95X3MI/csR+Dos/VpkfGq1zruU3LDp8Gdyc7Kz1Slc
	n8aiQVxKFQKVjhn4q0MHWA/6FmqshUo56vKXlNykmGBfBPFNuwx7/doFYif2JYqe
	tJJvow==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49gyu1894y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 01 Oct 2025 09:14:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-85d43cd080eso213451685a.3
        for <phone-devel@vger.kernel.org>; Wed, 01 Oct 2025 02:14:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759310049; x=1759914849;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rn3/KCzj9e9RYjWV5CHIU+LrVXqFk2tQ42l7zJWamMo=;
        b=HTrlaYovlDKreeFTcRhtk2vITn8Ht0QiBaQIYgQehqtzVgzt5fbBNb7a1nC0YnIx5y
         3cqR0Xb9prYpwyp6awhexCOTjaCq49p9ve4V8DwCeAwwvaRoPV6GchjJWBmhaBQWifCd
         3+RhSkpu210fYFe0KBwl74MaEsaHWwBkwKLPnZy4jnCXp2cWLlUD8lJqUkeiTFWAQKpy
         cTa0Y+99rY9INdvDLNXZkkKxiStU3lq3Gd3N1MPpxmL/wvqLhfvYvr1mrPW48QV5Qido
         uRKoWMe2Fw8xnrP5tkd3ac5eZGUQ3YZahxI4it7Bx57xeW9tSmvcq58gS/QqRach25qv
         hA0A==
X-Forwarded-Encrypted: i=1; AJvYcCV/cMb4ad2nngPOOS4JyK9PSTFcVSkui72O3WCPEDfzwN4MuyrlTfOlsmi1VIrs56OrDhOsrD6lOkKdIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUAVzRPGYn7dU6+iUUPArtZu8+EYR5wx36laDRUWRYW51lg9Um
	VIZcCqmXnHBr/WVEnjONj1erQzixLa3eW8EzTB0e6jl9QTWLVa2Z7wnOb+klhUfe2dyXv5+Gn3I
	Nnn+6n1tgtFwDqpMJqBqQLyLOy0R3rxlN0mV/b5FleGNv1vp588L8yTplyGIG/uCh5w==
X-Gm-Gg: ASbGncsqXnyzurQngGEncxdiJa0IrqBpQ+bSQGcmVdFkFoZ8pqccACP8a5XjWx+hgR0
	Oh+b/wptj5XFZ8dz00YABDxn8W81a1YRIADTr6QPMw4HbEHuJ+oSIMDu6qqmylvg2qm6d/DMnZb
	E25HWjPZstlu9KjSgHL7wtSCYNNT2eB3wcEq9VAWqTCqJkOuHk+MS2xPauY351OxWqbNXc5z2Xr
	FsImYt4fv4VmiM2EG6MuEqNfS0Bs7KI4ewetJJHRrsgC4sOXR/MHPQIDcpvgVgLTrEUOex67whc
	CaQtxK75wHsyHU3kYCnvp8jluB/v72Bcy2nHv16liCo24LxF3ybNG46p+U72xtc59nOD0hedtcP
	TXD4dJk7YD+LfMzQUC+RPEQWuUSw=
X-Received: by 2002:a05:620a:4095:b0:827:52b2:42be with SMTP id af79cd13be357-873705f0553mr259061885a.1.1759310048812;
        Wed, 01 Oct 2025 02:14:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGENrGs3rsybFlp3G03YUI5//8oZwz0h6YnC6O0icQirUqBpC1fptftVFehVajvDELL7EbvWA==
X-Received: by 2002:a05:620a:4095:b0:827:52b2:42be with SMTP id af79cd13be357-873705f0553mr259059185a.1.1759310048211;
        Wed, 01 Oct 2025 02:14:08 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3cedacd973sm725041066b.49.2025.10.01.02.14.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 02:14:07 -0700 (PDT)
Message-ID: <f58493a9-6def-4610-9c3e-d6a877dc23d3@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 11:14:05 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/11] arm64: dts: qcom: sdm845-lg-{common, judyln}:
 Add wifi node
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-7-b14cf9e9a928@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250928-judyln-dts-v3-7-b14cf9e9a928@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RfGdyltv c=1 sm=1 tr=0 ts=68dcf0e2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=IqCYnrxLgLuRO9zwK-sA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: p65m7aM-ZfoiqdFSJZfZWMbEoBja2cre
X-Proofpoint-GUID: p65m7aM-ZfoiqdFSJZfZWMbEoBja2cre
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDAxMDA1OCBTYWx0ZWRfX8sNA5jLiy95H
 NV4de1Ff2bDM5dzSs3ty5DTVYlKm/el86XWV7rAAG1UNwljlbmiYIhRL6Hrbi34xUcrkCDO3uns
 MVzFZfFrNUcl0FMIK6x3B6mEaPT1icBLCDCcG5xxByY6AQHT77kyLP94Qfs0izONabUCDDP9ueD
 U3R/YtwHJQHKlzRzk/KvFyFX/HCUNt+wRMV4aEgXXnLB0EZmlpHqU4Z0rrCNgzFQUb3pukXZB4P
 gmH2ajZ+cLUalBqsA6tss6AIrlVkgG8ADP6LxH3UThYeHqTgilQSlQy7RxbQAFmea232w9uvaaT
 vc+WNvKdMhoCbs+JANy6brRZ9IEZlXYFRod/g/CMb3/jCWdejNbU9CCCea+wzUUcoaBN3YJaXJy
 9/U2F/4AXM9FMOQ6M3XLpf7wgqP4ZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510010058

On 9/29/25 7:05 AM, Paul Sajna wrote:
> Wi-Fi now works with this patch and relevant firmware
> 
> [   21.488274] ath10k_snoc 18800000.wifi: qmi chip_id 0x30214 chip_family 0x4001 board_id 0xff soc_id 0x40030001
> [   21.498477] ath10k_snoc 18800000.wifi: qmi fw_version 0x20060285 fw_build_timestamp 2020-10-12 23:35 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.2.0.c4-00645-QCAHLSWMTPLZ-1.336037.2
> [   22.973165] ath10k_snoc 18800000.wifi: wcn3990 hw1.0 target 0x00000008 chip_id 0x00000000 sub 0000:0000
> [   22.983265] ath10k_snoc 18800000.wifi: kconfig debug 1 debugfs 1 tracing 0 dfs 0 testmode 0
> [   22.992048] ath10k_snoc 18800000.wifi: firmware ver  api 5 features wowlan,mgmt-tx-by-reference,non-bmi crc32 b3d4b790
> [   23.045368] ath10k_snoc 18800000.wifi: htt-ver 3.83 wmi-op 4 htt-op 3 cal file max-sta 32 raw 0 hwcrypto 1
> [   23.130581] ath10k_snoc 18800000.wifi: invalid MAC address; choosing random

I was only interested in this hunk ^

please trim the timestamps, too

[...]

> +&wifi {
> +	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
> +	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
> +	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
> +	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
> +	vdd-3.3-ch1-supply = <&vreg_l23a_3p3>;
> +
> +	qcom,snoc-host-cap-skip-quirk;

As the dt-checker points out, there is no such property

If your wi-fi works regardless of that, you probably don't need
to set the one you intended to

Konrad
