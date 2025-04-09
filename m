Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7321DFDB8
	for <phone-devel@vger.kernel.org>; Wed,  9 Apr 2025 19:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744226513; cv=none; b=UzyrHTeZ48z9KkXvsIKZEliSepZVG/xXLrKbLRhlTSdPgTAcnok1ObklqoiTj7ZxWuEOSA293trDewBroUv53EVnbxoZ+4bKc+SO2rB7t3Hu/8xmg3QXU5ISjwLHH5A53MhzvwNbNLjlyAJuaapZoOPLz2TZQ4j1wSJXf02k2yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744226513; c=relaxed/simple;
	bh=tqqtVLL0a7rnxVyWWNMx3H0IFxuLoh3JJkSTBORz7dM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kRKs5vRWxRkBeNxVRwqIacBiC4TwtGyMEu3wrIkVjAEClC9LedpiEN11PTdYs6ctqWUovKD1fIKjCwQv+pgH6B2idnzIz9Qf6YugSLuylWEeeCaxA/WZsTXQRfDZnQd2t/egJpouIEHoTA6yIwedRdOKfJkwh+PlO82sIOqwd/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FBUBH+Nu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FBUBH+Nu"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HDpMc030960
	for <phone-devel@vger.kernel.org>; Wed, 9 Apr 2025 19:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ao2/4Ir7LjEidGCmtnAUzgnJ1V7Yk4U0mm093nzxA/8=; b=FBUBH+NufFHcklkW
	+pkQwxYqymHBAdpD3DQ9e77+Bf9pxYOadwtNU+oar0BXBZ8YuGvK9KQEQ3mKr/mv
	PpVdW8sfpQ7oxKe0HnubXHyiMd8NqAUVM7Alp+kPbHnkc7o2uffeuN64eCzE2yVI
	JXdwYhwJ68+l70W4R6SwzKvNe8uVvoC0CEeknToRvAAZe6ewmdJ4zedDNAKGcPf2
	2ku0u8aut0we2EAFiiK1crcozY6SSL8xQtRal91g9vJD7ycPp7NB0jpid4Ztnmuv
	KLjDq1LMuMjuEH9rvpF/diEhN8GTppxlEFxdXg2uhqOHzCWqCkNLAzf29gIZWIvG
	Bbb6sA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbumjfg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 09 Apr 2025 19:21:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c54be4b03aso708585a.3
        for <phone-devel@vger.kernel.org>; Wed, 09 Apr 2025 12:21:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744226509; x=1744831309;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ao2/4Ir7LjEidGCmtnAUzgnJ1V7Yk4U0mm093nzxA/8=;
        b=FbfjpkdQ8nZo06P9IYOysWPc9CJaDmfU3eJts/wjlE3/A9qEAZDewD28LAAcyZn5Gq
         /o7rm/YdTDfVG9VrmY5l9HmYpIWNYb4TV288tG60Um0ifGOs4mh0uJsRlL8A47Y+niG2
         giDTe9pwqudhCIO7idVvKK14zeQCCYH3zfD0j44sx6cbyxDPmbGGbMadm7KIIMXa9KWp
         XDyDaIYcBEggrnq09f58KMhfXD1sBm9Yn77GVvGwR+KFEsksQ8utP9k2/WqRZN3kgQFA
         d43S1xqbdtX44ZDqEAuRWghcqQEuwmeNFQgKxcgC5KNn2xwyqKEUSfnKI6NqnQdO14LV
         RtGw==
X-Forwarded-Encrypted: i=1; AJvYcCVVBH3LDoCGmfnecg3RZKs549hjfSTNPST7PCQPdpP5pTT6WNRd9yDGjNDofGXmIla51+oC8QfFsZS/iA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAETgntsZRQSWoAQ0zPLofuzx42hFKaEWploOOPLtYo57+5JGO
	cL2e1lCkuc9ukSeSXKLkLTv1BQT7fehpT0vzB9W6h0tL8guTkPd9PGilh6PS8enAvtt2W9GL59k
	hgF5WWmN0S2D9+kx7VUeKiTdOPiSGDPfQx6GqdtQCGVqlXDX8mYDBqSa3TMiRaQ==
X-Gm-Gg: ASbGnct7MGT7qRg7KQbyLe4tiDKH6IyGbN7tNjUqUxWP+MqjKpL4R1s6Pgelrd+ELdL
	fRU413v5H7q2U/fSSdiDLrDiM56//xg0HCi1LodT5rjMIVYah6LkGtdsWnY9hn1Aw38Ssl0n/B4
	4tLLsm7yhHAJ4pSzmwmwziIP+VGjN5v7OuPJ26YXFO+kQafbB+N4Loo7d8Jz334E1v6IadFxAkf
	PyqxiBVelCLFA1MH/ZS7n/zrv3IRVOLsOztnQnpqlJuf4taWHKzkCibmvja/tPr0T3IECIC11fF
	FB6cPSQJylXbT7xCdJQuiRZWPrnwm2MwiiMjd4yF5/OVtUDQMJCneA43DJH1jmLzDQ==
X-Received: by 2002:ac8:605:0:b0:474:e7de:8595 with SMTP id d75a77b69052e-47960156d99mr14124371cf.14.1744226509606;
        Wed, 09 Apr 2025 12:21:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE77QLvXVQb8hQrclk4GktTwGGdd9UcIQL9qbqVYhfi4TU+IPv00TzOyHgAFpOf5a4SCAcmAg==
X-Received: by 2002:ac8:605:0:b0:474:e7de:8595 with SMTP id d75a77b69052e-47960156d99mr14124201cf.14.1744226509199;
        Wed, 09 Apr 2025 12:21:49 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f2fbc0c7basm1151156a12.30.2025.04.09.12.21.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 12:21:48 -0700 (PDT)
Message-ID: <2326817d-0b23-4990-b5a4-68efc8c20b03@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 21:21:46 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Stop setting dmic01 pinctrl for
 va-macro
To: Luca Weiss <luca.weiss@fairphone.com>, cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250404-sc7280-va-dmic01-v1-1-2862ddd20c48@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250404-sc7280-va-dmic01-v1-1-2862ddd20c48@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NazvPDv3ERWZh4W71tj4hmgMDiRDqdc4
X-Proofpoint-ORIG-GUID: NazvPDv3ERWZh4W71tj4hmgMDiRDqdc4
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f6c8ce cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=FVEEgxo8gcP725zB7O8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=722 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504090128

On 4/4/25 10:42 AM, Luca Weiss wrote:
> There's devices that don't have a DMIC connected to va-macro, so stop
> setting the pinctrl in sc7280.dtsi, but move it to the devices that
> actually are using it.
> 
> No change in functionality is expected, just some boards with disabled
> va-macro are losing the pinctrl (herobrine-r1, villager-r0, zombie*).
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
