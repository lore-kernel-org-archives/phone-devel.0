Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DE22D028A
	for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 14:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768315814; cv=none; b=Y7GzYiZwYg97m0HtY64NEN1Pa4CojlEnM4bxO7iSav5u3Pl1oT9P/Crdsf4uIyqFZiusIhF2Wl6CHvM/N8UbufHyyThFw0B8PTcjQijW21jrmPMRhwQOCrwBoArMJKJtcCY7LOJuw0jIz6PbrqanJGyPYrq9F6aX2FEQCtKEMqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768315814; c=relaxed/simple;
	bh=xU/v+1+Ag2SE9i72VtMK72lv1azlPIgm9eEwAdK1Gdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s4vx8vbzWyLMGiZLnuJDzegf5iH5njK5W9WBNUGMeQjMhPhj1Dh4El3aYD8RIxNWosNjRyEttuFoIkQLWDUoFtcVwZxARF8V8ROzJljIsdwqYWdZx0dBJ9MXplorjdKSVobodRhWzEjAAI3sVFbVI5nShFuSUpwxw+h044PgQlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vzqcb2dt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QmTtj1th; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vzqcb2dt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QmTtj1th"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DDH7ol3868700
	for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 14:50:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QcwxICmrR4gn1iEbkWO2XmXQzG34ygAOuMpV2HL6dSc=; b=Vzqcb2dt4qxwuj3n
	3tbwEq+TxmsomftMbdaJKB2dWG02cGZQ0B081IHQSeqUVPmXQjcZDZc6D254Acte
	II3d9yzPRmlkewFJLrY4w1CTuMTq75jwimIiyunT7t4D3RmQAwjkgh0asG+N1GWU
	7ecJ+Jvvmox+4AqJmqFXDUPK8jFO/MEyoZtBA9hnGc+yPcWdmotPRWiaQ3tsDZK9
	1ELHWZaOu9wXq2ITxn7pTZwfCDGTin829GIYqwNA1fpV3nzMvqlO5hSTZtpNFoDF
	qCqWP3P2dNIpfl1Fdg+RnsCfpSWhiWku84zBJ4EL/rnfWgB3uV3mZmU+Zapc+z0L
	IJorww==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfxk9nns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 14:50:10 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-64475bee138so2007823d50.2
        for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 06:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768315810; x=1768920610; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QcwxICmrR4gn1iEbkWO2XmXQzG34ygAOuMpV2HL6dSc=;
        b=QmTtj1thYCw+dfwSSkcIR9ik96T85FCtVg1n3wKuXiba2Yn8SEfjMP8xYzr1Bg0C1a
         WH1GP073FTzC7egKMTjBMqFn0FK2x+lfs8cpifLOF9OB6c6qGW8mBYzmEWWXv/6/2GIc
         xYNqwBP4hDutxTeJyJRAAVAuBITQPKZxBOjKby/xAhSnQ3Ke/0uqPtlV50r1LREHFA77
         s9G1YMwR0vEXwtOthDIyaY3awAvoKs3Wld7tUXOpqwFkztO81opT3fjWYVpsCiH3P7Xt
         4dY08hjVMS8ol1tYRl7v4e7zMnRxDp68nAYk5QE8owd34rvxyj9/yWMjsYzNK6ylftR2
         VdQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768315810; x=1768920610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QcwxICmrR4gn1iEbkWO2XmXQzG34ygAOuMpV2HL6dSc=;
        b=vbgYEBmJoqutkcHF1wTq1I8yV7ZOi37cvkv0geibKsrlZu6xpIwXJz4u3LgkDkYebn
         fETa83r0ulPrK9gJoJbNf2BqjbusWxxonX4NMxW3pxOuh/n4ij7ckaNQoQRuPfrjPlIM
         eoid5CXkrUAVmV7KpfPr4ElManlUVchrSplkNrwOctOk5sAJ8s4yixdBIjQEIIt7X7yQ
         eOvVIhaGacfJS/Y/NtxinTARbi3FgauKz7pMCmDp4GP415seu48nmLiLVGicQV4m7t9v
         ClOzSGadly+nlMeHjHrOLQxz8PEesdA57FXAdoDQKtv1xZGuABvCfgQ2lDigLnRvI0bN
         cBRw==
X-Forwarded-Encrypted: i=1; AJvYcCVsF4RBMXFN+2/3TIncPlRXURlkuguLPCZ6bZhGvOH4S8f1uaqwupXwHOB3ZDyCqBUMyMY2cVhw+wC/0g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7Sia3k7BwaDyO0Y+7wUIfiK0vdONy6oDnrL9393fGdxOCwKwL
	Wp+ObDWF66GMQdLGGhii5VZh9ROgbooAfK2fmlHPoZyzphvirFRvu3GNbc/OYBgnmATcnn0yBvA
	JqsnI2FOLXbhXK0khkUaQ+2jnVSdRCipTZwHxssT+4cdxv/p303J4eAuO6gWe5EuQYg==
X-Gm-Gg: AY/fxX6SmTRNS+g0iDW9+ZnGN17xoPz9mtaXTadmiHe52GHPkowB+Nm3uyDKpYRkpUj
	4fMOvfiUzJ2m5QwW4BOuOXjm+AyXGjI2jR2WKz1+iwiUJAmlOUU1m43040XiGybldVd6CGIU6yF
	T2/ZdNr2Hf2yb59GB6E0SUuVsJs3h941W5MDo80J64s17OeKq2+suXCsZfxmEO6IjoK0XlzPznN
	3KVNqj+Qrga08mwKx8g7JA0CTzqZ7CApe5rlKZ7XWfPR8hUzThbxvIX3xjkkvkahdphucgtiEXp
	KquDS+yR0J3cNlJ906MWFY2v8n6GrE6Ah2n9PRPHX5wAAsk6CSa5zxVZxtffuahuAw+Bm7J/xsJ
	qVKUsLk5Lgd0grcamZH5jXU9HtqOx27+OdJliPbf4z1L0VhTF54A+bMR8bbkW0696JTE=
X-Received: by 2002:a05:690c:91:b0:78f:c0f3:2e10 with SMTP id 00721157ae682-790b5701642mr160364737b3.9.1768315810529;
        Tue, 13 Jan 2026 06:50:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHp1gIBS5jEoXkt1plSH+bt7nf2F4KHwCWqllM1mxQRTlOiQ2zlHM62mWIaorCJLX3SUhEhcg==
X-Received: by 2002:a05:690c:91:b0:78f:c0f3:2e10 with SMTP id 00721157ae682-790b5701642mr160364427b3.9.1768315810084;
        Tue, 13 Jan 2026 06:50:10 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86fc303d7esm1058489866b.2.2026.01.13.06.50.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 06:50:09 -0800 (PST)
Message-ID: <d63d4c98-68f1-4dcb-b8fb-7c5daf343cc2@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 15:50:06 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: dispcc-sdm845: Enable parents for pixel
 clocks
To: Val Packett <val@packett.cool>, petr.hodina@protonmail.com,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, David Heidelberg <david@ixit.cz>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260107-stability-discussion-v2-1-ef7717b435ff@protonmail.com>
 <702e4696-5ff6-4c72-bce4-1a9a8ee1ba18@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <702e4696-5ff6-4c72-bce4-1a9a8ee1ba18@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7_ChINsczDl9XhQDa0wegOWRuSavCUDm
X-Proofpoint-GUID: 7_ChINsczDl9XhQDa0wegOWRuSavCUDm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEyNCBTYWx0ZWRfX59uydpCNoZGP
 jl5BZhxbZz8o/Tl7UyurRsQykBaEZrIoWT6kyf4h5PFmYPtogaAvtQxBcE/jkcM2+DSsSh5BnLq
 YX7OxdntealtvbaFzLow1D4dVuauSiJDrVZ5fAgKs342t2Wa4oLX5DpR6d7QJZqotDlUJs4a8xh
 I6iT0IYRmiyZ+cvzWBOeaRTwr2930d3gJ3EjjBUb9nN0/qcL1xT/Ns0D3eQPCl+WchHLbE5Iknq
 Hf6eZ8Tey59/AfWp5+aBg40Z4udRvUsyQZjJAuNiaHUhId1+pfCQd0fG4GF/dT6Ds1g/mfxmWct
 RJQuGwTTrzuJXtgk9S7/3rhKSaGw+azmf7Z1G5MBjSHQvA5bNiMz+KSZrHCPcwxwa1IFQ4GDxpY
 8Ce9beLajGwTXdFHjxJLTl294lbkZ3Zt2UOXVA+cogxUyplKlR/j96D9rYyXF4/QabPoiTkiszA
 HYKL7pON2zB9MoSNv/A==
X-Authority-Analysis: v=2.4 cv=PvSergM3 c=1 sm=1 tr=0 ts=69665ba3 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=sfOm8-O8AAAA:8 a=rC8bUFBNB4MWVkYa7ykA:9
 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130124

On 1/9/26 12:00 AM, Val Packett wrote:
> 
> On 1/7/26 8:44 AM, Petr Hodina via B4 Relay wrote:
>> From: Petr Hodina <petr.hodina@protonmail.com>
>>
>> Add CLK_OPS_PARENT_ENABLE to MDSS pixel clock sources to ensure parent
>> clocks are enabled during clock operations, preventing potential
>> stability issues during display configuration.
>>
>> Fixes: 81351776c9fb ("clk: qcom: Add display clock controller driver for SDM845")
>> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
>> ---
>> We are currently running the latest linux-next snapshots (next-202511*
>> and next-202512*) and have encountered random freezes and crashes on the
>> Pixel 3, as well as crash dumps on the OnePlus 6 and 6T.
>>
>> This commit fixes the stability issue. I've checked other SDM dispcc
>> files and they also contain this configuration.
> 
> Hm, we don't have this flag set in dispcc-x1e80100.c either!
> 
> The only random freeze we have on that platform seems related to PCIe ASPM with NVMe drives, but during display configuration.. *extremely* rarely, but the eDP display output can get stuck on a blue screen. Many run with clk_ignore_unused for the early uefi framebuffer though.

Your device doesn't have a DSI-attached display

The Linux clock controller representation of the DSI PHY implements
an actually meaningful set of operations that (un)gate the clock

Both DP and eDP PHYs just provide funny fixed clocks to make the clock
tree resonable and filter allowed rates

Konrad
