Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39EE34A3DB
	for <phone-devel@vger.kernel.org>; Wed, 15 Apr 2026 12:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776254763; cv=none; b=Zv/WzgJ8hWopAFltgksAKLOvWa9OWUL8kyGUIWEZtMN+oXrkDZPh8RPCZgeTFY09DX67qvauuZYCuGe9MTqCHAflr5ZeswKhO/kC4qoLNrPT9DlrBO1sqi75KqhFt04SfjbJqbX7GryDEpto6vgo8trV/lch+/fFlze7aUHvRjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776254763; c=relaxed/simple;
	bh=aS8vxSG2wGvbVUmsEsetZsJFgLkAtcc9AR7I2Ayxtdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fy8mHgtFkFk1SzKaxmioh6dycF42sLPjDOBS1qp6NW/mm/g+fwdQ+AsjRZWUTb/j9g3GI4fZocX7YEsm2lq8xOFwy9K2CiTNAOV6FL1eKrA8zZGYrwF7vQohxD2Ut8WbpcO8dZGLkNjQec6mX5iKzXq5Oi7OCKq0J3nr8LP+kow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oohwY2Bh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WUYdNmgn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oohwY2Bh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WUYdNmgn"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63FB5GD83059018
	for <phone-devel@vger.kernel.org>; Wed, 15 Apr 2026 12:05:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FVJC/jKElBXxUXb1flX4jdFwAfQ/NVixqAkpOCme1f4=; b=oohwY2BhKXqMNzot
	rx0/qZ7S0wCiHYbDA2jVDStCp5wOjv0wgfOnz2QxQyCTyMR2WONUYv4WgV7vSg7/
	HKYiI83AfxLki23s99ZqARIj0nqbcNyCJZprB36+TWTN6njEfo83yKdpzXsY3D6g
	SqP2UYKpjqtYnIrhFG/x6YFuz7y2dGi6p3FvBsnM1PDbCDwm68wB6ECD181UsLbJ
	FfUfCOGIcAT+ZYbPNvtGXWtsLDG4gnCQMyu8xXdLEN4RntLYDThHwjNaqUkTi0s4
	twJAEr3myYwvJaSA6/1qpcVsR3R3mAcSH/Arew3MtQh7dbR6IEohgY9yMZq1UbvS
	9BjwUg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhtepu4n4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 15 Apr 2026 12:05:59 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8a016b99579so23625756d6.0
        for <phone-devel@vger.kernel.org>; Wed, 15 Apr 2026 05:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776254759; x=1776859559; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FVJC/jKElBXxUXb1flX4jdFwAfQ/NVixqAkpOCme1f4=;
        b=WUYdNmgnU6ATTauNpYl94EIyvxBL4kxbPsUl7z/ewTWdhXETIxFWQMKdSDlkn+wrXo
         IJBtkork4v19QQKOEgAET3qjeIbItwOczz33HNrwnazaBMKPxxHMb7BsSeFuUNrX9V3E
         63KQhCpk6qBZ0vIODawdz+0Rnd/WpoqElFNQMyXnG+fXejJ4LIFRoXTkxCvkyOYzX8P4
         UCscjYiQKgoJyTy0KUUDKC8g8IG0bDkLoT3CQun/QY1tqDXXXpsnQ2mHu8e0/NAlPYNH
         EY095Mkxxg0ynhGTa5iW9/N2oKKj7fICPe04mqv6cZRuyoZtBtHRylxqRwUX3UiE3QZ4
         iIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776254759; x=1776859559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FVJC/jKElBXxUXb1flX4jdFwAfQ/NVixqAkpOCme1f4=;
        b=WLaRyg0VDQqfrndnWq6QNAPeWXgm/QtmOYzG9xTawtRNe6b0XrBsHfuHXLvjA/cgVn
         sWxs/u+nCT98eTf8kUMPQL/nBIbVExenUwiQTuyP7f9WtXyrih59gJ3Ryyg07XAK/1N0
         +hT1VqqtPpKau4OSnHayvpsatYIz+TCd4fZGEjiIjbER+oX2ae0GBdRVWTJHD9gDBUm1
         40pX6W27WDDbv/h9J9pawkKI5H1M5vChXatGYRxw3tTm+4/FKJT/l+FG1yo32/DbF791
         ZKRzJTodh7CEi8wWUsxt/9kfR5PB8zt/HpZPUVU5pTd6Mhh4yv/eRjIBYYzp3dFPJ4Wb
         ry1w==
X-Forwarded-Encrypted: i=1; AFNElJ/GDs6Lu503S43w5g/byVyfsxlrHFSj0XdTVJ4OGNFyg/dX1R70gaKHeYcra4DC617SBM9HMwZ2WSaG7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZVpFHXUejrza8VzZbU8IAP76h4cXK/Am9boI9uQdSvKVg/AYG
	EQuagzEgUz8WGsMv4Tw/j/nUn3grrGp9rgZ6qHk+hA8t3aRbbSjIdTtvkXrjJyzy2Cn7Ha5eTmT
	RZR8QbERos+qkAOcQRz3gIy4KAzTn0iAp1zcX3r/8if9UlYRjkrk7OVdNCtL/QnvS8A==
X-Gm-Gg: AeBDieuB1qjCOjdzq83aoC8BEYHwwVR4G2ekCr4bPr0Tkd7DfWo3TcVrDQF2TBkaGwe
	aFqdWyjZ71wNqOHp/tjbvoEZJyXw6TQzLkGwnXRLSN/gt+lH+5EZYJN3xp2Lz7fJnNTHIBZoB2Z
	ezxCa3ulvhM2iNGFVQLr8CF9GmrtigyO8yD7+TkK5le2Ma7/36vMcaTUtZ0CTD7iPBXJXDpZxhF
	AZlZHVTyqI97W1GPW4EgAnZDqrggyjCBWqBWAYEMGyykJUd0n+WTS+s0gP+QD5csYHJ7qhXE+pJ
	Gl9gZPSGpLvrGb+6OVkAtj+LtlrWyjwwsATLSQQsMG1GvxNk1F5doHkMp6NBjeVFtABN5BrVrhV
	kt3vJXhFyfv8mKh69u7g0PPxE1Ukl3KagxaJCbIn2HB+PYfCqG2rC4fkIMFkzdhWruUZIo4wiCx
	rs1sM8MeJT++1wYw==
X-Received: by 2002:a05:6214:d03:b0:8ac:af77:c583 with SMTP id 6a1803df08f44-8ae6a900747mr24215096d6.4.1776254758788;
        Wed, 15 Apr 2026 05:05:58 -0700 (PDT)
X-Received: by 2002:a05:6214:d03:b0:8ac:af77:c583 with SMTP id 6a1803df08f44-8ae6a900747mr24214816d6.4.1776254758360;
        Wed, 15 Apr 2026 05:05:58 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba173930174sm51117266b.18.2026.04.15.05.05.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 05:05:57 -0700 (PDT)
Message-ID: <d407e341-e54f-4b1e-9000-3e12eb2faafc@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 14:05:55 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-shift-axolotl: describe WiFi/BT
 properly
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260415-axolotl-wifi-v1-1-07df39cfc0a4@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260415-axolotl-wifi-v1-1-07df39cfc0a4@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _YplRTOphpWabShFuDQ0jmlJkwSVRKeh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDExMiBTYWx0ZWRfX8jFPIxLQlHA+
 HYRIEpavH7exdM4amPCyiyPjFQ3436XMPWWoQeysJZlp8IbnXpBQQcuh4xHxfJC72TH491zUUS0
 qscwTzHRatrvRJ1l77wmxrFke0Zl7NVTV78c9pXy73FTul24Dwru0HlHQPu9ozpaPBDey/iMYBx
 oM4K9Yt6WyoKVpEaWmKlUSQwao1TE8icnJGdpw7elLLm3bHGooOBViNFAJO01CExi3cw9aDAUqE
 DBzBun5jsfv2ZX8OUIKYvDo6Ijgrvvwi+zWZHaQY3SzGJCuI+6CjcIdhFa/ELlsztO0LlxCdRvm
 2nb8gARUbxuO2dVAqPTUFre2dc3L8U9UbqZpXeHkBYfpR3O23TVI9QCZvkoFMZyqCwigH/tc6Pa
 YZTtHCotMMA6VCZTA0F4FR2DeJg/p99VfJoUuJ717M2TE2j2sB/7QwlVeIKdmYCHFAdJS92cUk2
 KK3n8/Pq0aU0yQAmbJw==
X-Authority-Analysis: v=2.4 cv=CoGPtH4D c=1 sm=1 tr=0 ts=69df7f27 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=i1Qc4F9nIsNgxiQxDngA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: _YplRTOphpWabShFuDQ0jmlJkwSVRKeh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150112

On 4/15/26 1:56 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The onboard WiFi / BT device, WCN3990, has a simple on-chip PMU, which
> further spreads generated voltage. Describe the PMU in the device tree.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
