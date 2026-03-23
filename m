Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0F438759B
	for <phone-devel@vger.kernel.org>; Mon, 23 Mar 2026 09:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259797; cv=none; b=p68zAjeDiIpA9ugZHgR4Ftz5M5UG3mbcOWESIHEX2gkUWTP5F9KQHs/tq22/rLULyawPRTuxB7bggn0mT3GtFylmY9K5OooDNjwJ77ui6SHDjfUcIIF2S4Rx8odN5kj8IRWCrjv7cyCCYExgxSP2sWImkuI1Cxz16hkEn4Mv+6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259797; c=relaxed/simple;
	bh=VxA7xozyGLK0LLCMm62CBbAm+HBWU+eTUB895uTPzLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OzHhl9PjDnSk7uz3E8BPgqmF5PbeijQ/9x1eR6+I5yO0/oJmOC3DmswypmvqIxYfoGKFSGptDTscbzgl+5Cl0PtEeiF4J3M4XmIjMe57UIl5WORZk9A7C58hAANE4k0tR4dj4t0/1QYMYLPh0m0ldnum5mAV2B5lF1wC9TrVdn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WZVMTSK7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rnm3tNyc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WZVMTSK7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rnm3tNyc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N749to3393285
	for <phone-devel@vger.kernel.org>; Mon, 23 Mar 2026 09:56:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b1UJyOk+7UBbUzILF8RGYV838Vf2ymJyX7hDFUuJmME=; b=WZVMTSK7E8dwP/Yt
	hc2ER/YwcjTHBSCakDAr9EEVZsf/7X5XBm7RNwAbvffj6rcWGts9LY/jAKAM/76w
	EW+i4bXKL52NfjmELsvH7lSqxy1YV2yWItYTsQzvQ/F/J1H3kcuOf0Ki9XOmq6GW
	J/yo+j3nLeTXHeaQJhz+PnK3Qb2JLdijBnL7Jqj0pRhp3VLWXKtg9L+sXnGwqqMT
	8AY0evEd84vMIzpjmRs09z3FkVzUko7wjCIGmCWb8ChQBPQ3hhat+W1noqpCIBx+
	xPUzqj1LxdTXQKHuv/N2MxxS6G8NKYsAwHykg01hk6d9wPs+MSuDzPMs/KFlOyR+
	IHtt7Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d2ca8jrsr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 23 Mar 2026 09:56:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b2a1f123fso28013901cf.0
        for <phone-devel@vger.kernel.org>; Mon, 23 Mar 2026 02:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774259795; x=1774864595; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b1UJyOk+7UBbUzILF8RGYV838Vf2ymJyX7hDFUuJmME=;
        b=Rnm3tNycel9dogNNLxriJheixofjWHs36lL1AyR8HNit8T4yR/qZHhbmS27IdYREwv
         Pi++jufHm/qIZPnVNI0n5EAxHcn9jns7pzH/u7wVoI6FepS2gkdLJH98VyJ2X6ewBaCO
         /mQNYf/tbUoTyY1USb4bGYCmQxzQTIRcSyzjn9uXag9F4IZEJsxm6mqz44G1o6y2JJdJ
         x/8HBiW2slADK6ogs+Z3a72OljN2pG+S3UxPGMqEDqYRMudrU9r+5yRlVFAb9fpsHWD3
         ubrL6WJZUQbLtGWx4COJMsMtGGqdaXBi+tyb5oHKQmLlMLwZ6Vifbca60FKDu+ivQXjE
         wdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259795; x=1774864595;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b1UJyOk+7UBbUzILF8RGYV838Vf2ymJyX7hDFUuJmME=;
        b=H8tQ22JIJAoN28/mxbbIUAQqLSI/zMQG/e5PAsXGoC5TSyC8zsZslq1yNbGnVipsrC
         IYHUzwheBCHlK1mboWs41RRh1qlCYpdGfIvaZY5kSX/n+Ueu/r1Mqo5pCTXYoel7ksty
         C9WuBb9yWe++cuQC/NuVeUI7o2zhojawUmE4Ieqhzee8K0luGTjOzKcLI55F+WupsK3e
         MTkmvNlc1UhSO8/LySSdSgX2SKX/9aBQgFF1G6sRdlrMhl+OOnGqVodMs7uBRJqPUsVT
         WKxfGMN0Yevq3z5gxlnXjztPkugKNL1+vezkri4+MNeOyPES9XLVfZtU6kNwLwdjO2FZ
         +aYw==
X-Forwarded-Encrypted: i=1; AJvYcCW7yt8SlOwYCI8/AS0jkfex7O8qazQ9vmmH5xjGEzR/VcYcbbID/FuF/1rSWuOK4jOsxtSXOasiFozDYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcbACdJgGy7jFObBAkayYFV4ySc0mDf8/wbkR8KdYEGj1x42Ks
	p8CHXUsNsBy028NXxmqq0nam0YCVkVXMohO73RK3joWJbULWt8aiXD2bHTmr1uraiGZSNkrkKNs
	7PFkGnlkDV9IiGeAUSq+VOWKBo0I7Fabm4KiH3SnmGNdxm9Qt/VW3b8NTxwpiqvrLpw==
X-Gm-Gg: ATEYQzxY4UPHRn0ZyqZemNDSrYA5D59zYYe7aa6YCmWZ4qBcTRxN9ArKhmt0oTfgces
	Vh8RT0IOc8T+pY1pOgPp4H6Hrg1ts4xLkDF3xhw51vIZwvXj0IswoKOGVQt/pMYIZa7A/rU5vHZ
	KIdMqEYpP4ndIVtZDfB67qYKm78bHv3osaOwD36t0peQr5VYiway1Hu13r2vzJylSAw5aT4EBH/
	pklCkZf2C988DC8Sk7WASZrrjDXYNIpf2E54k+XI3KAMG8UhrUm46cfzuptrjGTlyzRMNrF3zEN
	4OuJaauVGVa61kVxvM7H5pzS4mU3sToUh7cNVBjYJYXketrJUftg8t9j0ojLTV1ZrsPU+bN/Ztb
	xQoQ+rDcFYw8JmRkmEvsxNkDVXrD+Wgr88/Pbk4IOBmNQVG55RF6lHqn2XhSH0WJK/scV8JsVfF
	Y0Fpc=
X-Received: by 2002:a05:622a:6788:b0:50b:5075:5256 with SMTP id d75a77b69052e-50b50758e93mr43701361cf.9.1774259795167;
        Mon, 23 Mar 2026 02:56:35 -0700 (PDT)
X-Received: by 2002:a05:622a:6788:b0:50b:5075:5256 with SMTP id d75a77b69052e-50b50758e93mr43701241cf.9.1774259794756;
        Mon, 23 Mar 2026 02:56:34 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285207500sm2467287e87.41.2026.03.23.02.56.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 02:56:33 -0700 (PDT)
Message-ID: <8be2b64e-7df4-419c-84ab-bd4d728bb282@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 10:56:31 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sdm845-shift-axolotl: Enable
 TFA9890 codec
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dylan Van Assche <me@dylanvanassche.be>
Cc: linux-arm-msm@vger.kernel.org, Petr Hodina <phodina@protonmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Alexander Martinz <amartinz@shiftphones.com>
References: <20260320-axolotl-misc-p1-v1-0-89c9b5ecb26e@ixit.cz>
 <20260320-axolotl-misc-p1-v1-3-89c9b5ecb26e@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260320-axolotl-misc-p1-v1-3-89c9b5ecb26e@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NiBTYWx0ZWRfX3UwEZnd0O/Y2
 XMfIvEHR9ZEYhuptuloyqZ9MO3xAXH2vcz3gxUpIBLUzQlSCbWmD7wJz5MgR5opnO3OW6GLycqa
 VhOWVKGvNS7ZNfvFAO4fXYcJtj4g5zTWbbYDQ33L/bG0FG1flzBRqv4F5z3VlsytZtih04tPUMe
 pcrS4rOBsLcuhlkVrQ29WSH40yP5/0DRYgqhfF/SNrD35S1nTAIZDJAXWH602HD8qE9FR0g4B2h
 C8mIyZI+45qpfQFUrYZLfhdHuUEu1tMN+AaSuRpSIdsZQ/9ghx9nYVBTnM3PYyYwHyrY068fts9
 2jvewo64FjUlHN2cgX75weaJO7HP6/Q+cjnI1VrwuH2bsUbjmCcFQsQ5UjDg4r87w+Y9mg8mSzG
 TBj0WpcQTKvqOK488q7hOXDJO2r5NwbCM11GROVx4HoUJa/6Ivq+hmbhoQje7WDR0XtM3JmtgNj
 QbpX9TOX69rqLg1MN7w==
X-Authority-Analysis: v=2.4 cv=cf3fb3DM c=1 sm=1 tr=0 ts=69c10e54 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=7Ovdx5uLAAAA:8 a=EUspDBNiAAAA:8 a=P4yiY5-ZpFYs4z6YB5kA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TQZWkJv5rNK5-PaLMsrg:22
X-Proofpoint-ORIG-GUID: 1z-kgAKdW5CAYSTzU-v1DpM23s11dt4c
X-Proofpoint-GUID: 1z-kgAKdW5CAYSTzU-v1DpM23s11dt4c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230076

On 3/20/26 5:29 PM, David Heidelberg via B4 Relay wrote:
> From: Alexander Martinz <amartinz@shiftphones.com>
> 
> Audio amplifier TFA9890 is present on the board.
> 
> Signed-off-by: Alexander Martinz <amartinz@shiftphones.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
