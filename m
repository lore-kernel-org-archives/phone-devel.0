Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EEB2E972A
	for <phone-devel@vger.kernel.org>; Thu,  2 Oct 2025 09:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759397829; cv=none; b=FEjvFrxD6EHcIIWB40jTiGa1QyQMKjw90m1BONZdcHtfpCMp2yd3pzFXOJ7065BqBVutOxvJB8ymzsQ9VOlEUIRA2lkfWyE1BqgffX/YWkOR0TJMygvBJ/QbEJc/hr+VgW4wI7j/sHEOPxwpHOd2Y4urcDxD1EHLpmNoIdzoxv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759397829; c=relaxed/simple;
	bh=dvC5aj7x6LVVGqVL6TWGGwvsTPpa+pvgVq2m9BKUMe8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FSdAijPRHRk/BV3uAa/kV2fpFcGKqSOLGlesI5yB7zOOx4iqlyrCoF0ieBW/4/AgoLkh2uLgODlIUZan/MRsvCkYZZoWk08R8AiUc05ErA+vEa1pMH22dA7o/BjCnPgp7bA6R7N+noEwwwr0Q6faM05+lxO/I0Y9aAk9gH9gde8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=onyGy9W7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="onyGy9W7"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59292EmM017999
	for <phone-devel@vger.kernel.org>; Thu, 2 Oct 2025 09:37:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3s3Qu466iD6u/7eQr/tGTVs0AQ4z16vZcusQilCroYY=; b=onyGy9W7e/rJQStL
	PzsnFvHp0TjBRQpTzbqblUo/aHdg3VlWQlDENMLelgTgdxuRODer3IBAd2Mh7Iwi
	BFlApNVqeWAXqi7ibjGmH3cM8sliDqANrect+O3BMKzvRjBEUi/11yGp7Uu3u4/J
	ju8TZfxLDbqNPyzJxREL+bTx2J6snJTetrFzY1FPJ478D9Ecs5unP6PIkLh3Uepj
	82IyercvLdYkTo0Eqoiinwxr9qjRmLuPo9E+gWH10hBjPtIJu8/xecFfSkz1U144
	BlA2bzAfAa5IxUtN7N7SHg9tmANq363UiZCqjetybP1WgPObo5VxG2vLFmY1myxn
	hhI2JQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fyrf8x0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 02 Oct 2025 09:37:07 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-7cc365ab519so2133836d6.1
        for <phone-devel@vger.kernel.org>; Thu, 02 Oct 2025 02:37:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759397826; x=1760002626;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3s3Qu466iD6u/7eQr/tGTVs0AQ4z16vZcusQilCroYY=;
        b=lR9RF9rT9nMeWowaXc4I1fbq3s4fkAfubrTBHceK3/UKQCEsYTH1Y3DTm2cGK269F0
         GmwocrPvGM2KYexrSpzE5a+rEWQ3Qf9aiHrEAvovwMVrRcerK7XQQJc/fsBV9YnptaUZ
         UyfBu8SNvMpBMV4COr7d3hTVlfyugshYKrjgyjf4fSRVA9UR8MGDlXZloYvUOsUuOs7B
         immyRagBg03nC0gg4lv5xnMLcCBDvAxZkspAia23DS68zqISySrI/+fhe73U0Jb627PV
         rN9y816P0eSylkjYtH0oE6+Jtdhn+nXIGOZzUtJJKrhiWYXmGz3FfQwLTyKFXekL7gCc
         zXLg==
X-Forwarded-Encrypted: i=1; AJvYcCXLcO74oBYCssfKoZia6o/vF/ZliRp49oT2UnxvE0lXCUKFhwTqxDrtUIzxslKqlI0R5wfA2t7Qv1p3Og==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyph5ML8lu/4/s/lm4fGlsFNcpqwy7i2Xa7H9i0Tom9Ewd3u6m8
	AWg9ibZEfiQueQ5Krx+/YDNMlQyBUXwzLgWENnwjwN1JRy9lnNnKuon/R1EvRo7rgfLbImtTi0Y
	u+wcilwHmF5ihc303xPmrJ3YqBKxb5sPODspd3QnPlOGVPGH31W+H9ua6aF+vr3IvGQ==
X-Gm-Gg: ASbGncvfTMZY2roZSr+3KGsMVjIW2LKtyR/4R39NidfThVr5hRYWFd/KF7XC9be4jF9
	Ws3zmR6YGK0FIICj3hx2wyoyL/xR/XiZTBW8OCUNBjOtZczgGLPffKejaZJ4bsryF5Hz+CKYUL6
	CyoldB3RAfZ1xPvcGnjBEiyYEzV2Qaq9haEFubuKZg8Y2fIliVQ3Am/ThevrotJVWwa0ox0EOIZ
	vXI38zKJ2tgEE49Yf9k28YEkfttf9Q0kgTUv2k+aQyCdcwOBKm+ksmlyGZgjXmKYSH1CEW22pcy
	JqSsc4pxr5lfyUxhszRiovytFH1Mb7zY1vp+cDIaPz81qtckm840PnhgEeAGlx00km19jQ1Mmyy
	fVrDL1GoHyqBz/pIhoBxCD93uHqg=
X-Received: by 2002:a05:6214:5184:b0:789:e48a:fc05 with SMTP id 6a1803df08f44-873a5b356a2mr60282296d6.6.1759397826303;
        Thu, 02 Oct 2025 02:37:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErl72Ov8A6h6hpFWJYLw4FLn8Y45zGs4EHrpv/AiJf6QoFNUh1bWYskfoORIRZsVZrC/1sFw==
X-Received: by 2002:a05:6214:5184:b0:789:e48a:fc05 with SMTP id 6a1803df08f44-873a5b356a2mr60282166d6.6.1759397825670;
        Thu, 02 Oct 2025 02:37:05 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63788111f1fsm1501744a12.36.2025.10.02.02.37.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 02:37:04 -0700 (PDT)
Message-ID: <7661d9d9-eca3-4708-8162-960df0d7f6c7@oss.qualcomm.com>
Date: Thu, 2 Oct 2025 11:37:02 +0200
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
 <f58493a9-6def-4610-9c3e-d6a877dc23d3@oss.qualcomm.com>
 <d38801bc77ad00442b1669ea252ae30a5c6af5b4@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d38801bc77ad00442b1669ea252ae30a5c6af5b4@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lhl0ghBbM6xepZVQiM7l-4wG7KOr6YrO
X-Proofpoint-GUID: lhl0ghBbM6xepZVQiM7l-4wG7KOr6YrO
X-Authority-Analysis: v=2.4 cv=etzSD4pX c=1 sm=1 tr=0 ts=68de47c3 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=hUOHGeh7YKFiNrxugmEA:9
 a=lqcHg5cX4UMA:10 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDE3NSBTYWx0ZWRfX+U5Lj+dzfkth
 yJBuwNoCXAP9IJiaX9eh9C8y5bNiyOgzBncQL0MXPTJO/sSUrqWvjyZBMI1MRiTrOFf+phgG9Xq
 diYyq8Y87lRVY83XCFLhrX5zdKrAx0ptdJ8QGdC4RTAJpZsYDbULT9hpHHQohX3EPoqKiQW343r
 XyQ4uuT1Cv8XMe+H85iM4RcVuj62AFD2guLZXLd/xkeMVMzyx1jXkHoGrjqYuoGok5G1t772yT1
 IbQXAx460od6pjNI+KaCSSppyJJGzR4EoUyYt5Mng/b5LAaAZ48dnwpxlCNzi6kNR3DNthKKbFF
 p8Bxrpe9DMn9jFVkKYWg1HUU+y8ywQuKtAnhrkki2V+sNY56ecpzYcka9YYEIxfxa/DTpB4SBCU
 zelqD6zX7usUBDdaBGDK/dbYsqHuSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_03,2025-10-02_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509290175

On 10/2/25 6:51 AM, Paul Sajna wrote:
> October 1, 2025 at 9:14 AM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com mailto:konrad.dybcio@oss.qualcomm.com?to=%22Konrad%20Dybcio%22%20%3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote
> 
> 
>>
>> As the dt-checker points out, there is no such property
>>
>> If your wi-fi works regardless of that, you probably don't need
>> to set the one you intended to
>>
>> Konrad
>>
> 
> Perhaps this only exists in the postmarketos tree, but it definitely exists, and doesn't work without it. I'll remove it for upstreaming for now but hopefully someone sorts that out. upstream.

So you didn't test the tree you sent? :/

fwiw

drivers/net/wireless/ath/ath10k/snoc.c:
	qcom,snoc-host-cap-8bit-quirk

Konrad
