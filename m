Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAB5205AB7
	for <phone-devel@vger.kernel.org>; Mon,  3 Feb 2025 13:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591016; cv=none; b=IgTVM7+yeYc0OPZa8dzY1JwqjkTBWD7E0rdhftECJKm4pOXOoFKRfqqw4fBu0h1/MeIFsvC3oljV2Ewk3nA9QncBXB9MXZno1Y7guzIeRtAot0bK+ng0xTzTbt/IspCqVNcu7KpL0xLJ9+8NylutiwQTbzZw/qZgGyXabYcou3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591016; c=relaxed/simple;
	bh=zz82p7hcneLrafwVsfA0STSZi0ieg+1/nWnNxjI3JCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UOC3LTE1phCCIBQksWQ6STb6S14kv38wHlE0FjRcY0decGF4qK9TSadhhKsKnx9TjD+GUqwk6X52m31R3wv5jA3Ouu+LjvNcjTpgmxVe5eQ21QT6eLsEGjT2cdNJdwJDmURodvnHXkOSA7HITT2uHJQ+dKh2ImtJaRVGJi8vmUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cobwUbxO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cobwUbxO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513BUPFV003806
	for <phone-devel@vger.kernel.org>; Mon, 3 Feb 2025 13:56:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N09aEg4/UjLzB5RTR47KifPhflhm9MeBFZX2WuYWw8I=; b=cobwUbxOXAsBqcnw
	Afsp4K2iN0tc31AOuklNlCpwBhZn1lPVKBCklKB2jmMLjvPvcasZCR3u5Qt1URcu
	aInGWPfl7p4hWiLeSzyO2ev0VpVSc80Pe7b3pC3lql2xsQMw29Vs7fHPwBQPg6Kj
	wlPU1mqL/3I3iwgDGi2iGXyrLrwkwG3rweKpxPYzOEnx9uU06QOANwUeloX7GeX/
	tGewfOdAsVwnC8gr6+nEs6odMVHKxGmWb6daVieGUodPJsjnrxEZqJjDEeDoWetf
	8YpL/I1cb6B2Sy2k4Z428U61IoEpJlqCxxx2hpS4djOK+LtHYAEZnGpUR/DzV+E2
	w4AmiA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jw03ggp3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 03 Feb 2025 13:56:54 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d880eea0a1so9756176d6.3
        for <phone-devel@vger.kernel.org>; Mon, 03 Feb 2025 05:56:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738591013; x=1739195813;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N09aEg4/UjLzB5RTR47KifPhflhm9MeBFZX2WuYWw8I=;
        b=jJ/xnOEZ4SgCle6za7S8cDfRtPza1bn4yNYV4CD4h1WR93i1sSMuWPSPuc68c4dshA
         Mt0lNhYt6qKTsOnIDamq3mHGpai4lOZIJfrKSKxjdgSZV260uSa2LF33vFuhuVJBHBW5
         DWgeo9kSQzxPChqBh2+memOIfjFReLRrldQ/PlaWnAP6mJMLuXuqSBPMePRE1aiFGypR
         NFyl7i2ACbdOlVEGw/tzRDX1TbFhFwEPqPHfoffX2A/MNSyV3fko12H7aKjFnN8twAhB
         NPMc6ZH8lUswdB005nEikPqYTe44mpChh4peywubm1HN19kbsY/xIVp4Jn6Lt98lvEua
         hQ1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWhOimdKnBFamDn7DPp5Tw7bW4n3cXtgkQMQTqCGHhWqi6JcHJuLI+LBtouVTAS/a6RkZfxbhIS9kGpqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0e83E50uQmTGlBmm6OjLbPZo+UKl6qGSGoz0eydhnaBCDnjWE
	g8bgpwkEOyTddla+2rFY4Sh0ayJFGkqZeVi2kBXCOKM4p9JP1dhE4NEAByZM4v/jcmHb695GWl4
	AhVtd3gYNQMCVIJvmPbeAiZIuDN/XOs6gHFgtAMhg/1eO6w/DrXL+OwRGtpD1Xzyyti5Yrg==
X-Gm-Gg: ASbGnct5BDoWuy9mfmjWLJceb+wAn27KT32YykWQ8W/5UDYRYq6eCiwYJEkFHzKvelF
	+bIp9TAuyg3whl0Pi9CFfzMcCN+Q0y1eiihgp7ilj5+jYTGjY0mPa/ztkpzB6C/8pzyPDw8TbwG
	sJmEKEUGN58xw0ea8jf/Ru8IRaQYNTiiGeUxFPO6fwb8PFIUmEU7uvynePYxG4yC00R1RJmJF1B
	SHYSOCx7Z4H4mJb50EqUQ4CWr8fNse1cCJNefJm7usmv6NVkiaY0h+Mzhk7la74kIBM6llLpBNU
	Zhdo+M2FIDKSoldWARfBk1VpKDQhfYkKwlkLtnNWwjtNZ/EljVxNoNY+z90=
X-Received: by 2002:a05:620a:410e:b0:7b6:dc0f:406c with SMTP id af79cd13be357-7bffccc503cmr1279660585a.2.1738591013150;
        Mon, 03 Feb 2025 05:56:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE62P5OcOODF9zaK87BlabKbKuPd8Li0k9f2+3Xiecc6zvEmDG9TbpzHHpkVZFYZoCSltuIgg==
X-Received: by 2002:a05:620a:410e:b0:7b6:dc0f:406c with SMTP id af79cd13be357-7bffccc503cmr1279658385a.2.1738591012780;
        Mon, 03 Feb 2025 05:56:52 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e49ff3d4sm756840066b.112.2025.02.03.05.56.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 05:56:52 -0800 (PST)
Message-ID: <f63c0fd0-e94d-418f-b921-4e7af9d43c31@oss.qualcomm.com>
Date: Mon, 3 Feb 2025 14:56:50 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable
 display
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250202-fp5-display-v1-0-f52bf546e38f@fairphone.com>
 <20250202-fp5-display-v1-1-f52bf546e38f@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250202-fp5-display-v1-1-f52bf546e38f@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dv93KrBJ8f0Ec7V_-68OLbtTMuVYddWg
X-Proofpoint-ORIG-GUID: dv93KrBJ8f0Ec7V_-68OLbtTMuVYddWg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502030103

On 2.02.2025 11:45 PM, Luca Weiss wrote:
> Configure the MDSS nodes for the phone and add the panel node.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
