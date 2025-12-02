Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF9F2FB983
	for <phone-devel@vger.kernel.org>; Tue,  2 Dec 2025 10:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764671671; cv=none; b=Uu3x3/Sod7FKEYbrHOQA4nb+J3QY/QpLizUWJIDmtjo+0Y2mOuIIPSz7Zr1l9+vixez6/OD9fl+0AIE8AgIwEspIww0A9+yfGfGUwnNEY03Ee4ne1SIbwJW9CujrsUq5cWBpBH2v2t3aap4/GdQR3s1Vv0rv+t4X9XSAX4Aego8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764671671; c=relaxed/simple;
	bh=mRBpEIMbCWseS8EmKMcji3u++cs6Nw0otPP8nWuP3cs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FlL97mvSTu2DgXNErxu1Bhzy6miq1olnrfPVuwS95fyvR6vSjGmxG6KKWlSc8TP9NHkcaeeK+5hP5k4oOMa8fbABza/0MeosrcH9VeU1F0WQ/wJ0mLTQBFtLpjQdnm/COjaW9/ZQfOgtynL4CQem3mVHaaOoftQ6vRwf7K136z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U2pBJPGG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SjXQLIlR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U2pBJPGG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SjXQLIlR"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B28N91f3284660
	for <phone-devel@vger.kernel.org>; Tue, 2 Dec 2025 10:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iVaDDj93Qsixiii7tAc2HvTx01p9MyhJSH+M1UmH+cQ=; b=U2pBJPGGNXyLBs2I
	wcQSEmN5QnKxCnZYLXVvBFcVt3RQ++bcABj1oFbIhoR5kovW8hSORDsvQXKgrrvV
	PaTnwVqohaORFql1sPTddudTIxor6YYHWgez4u0S4sczH7k+WtpVhTERVUKNTnSx
	RiGpT7R5dnuI6Zdu6d42E91/61XJbsJuE/WuprZVSC8DQqXJTcX61iFWC8+F6J4g
	2akLYfhYlJ6pQSOOo9tYfnvxtcX9nIUVkyjZ6YrQL/n86NjUDdnI1Scba8uZz7/y
	oeNqoW9/13szX6V1j2+Lzlp0UXOCEqC4zNBTr5OWZlo+mcwNWbhcG54KNbPsEoDW
	ro1IvA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asvj90dsn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 02 Dec 2025 10:34:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed83a05863so18963951cf.2
        for <phone-devel@vger.kernel.org>; Tue, 02 Dec 2025 02:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764671668; x=1765276468; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iVaDDj93Qsixiii7tAc2HvTx01p9MyhJSH+M1UmH+cQ=;
        b=SjXQLIlR7p+u3CeTtoItH9DusoZ7pv3bIITpNsL/hhDtSMMAUM1cgG+UOW5G6BxkHb
         23HfKdvdxVYdt+KvmE6dDAi+vzhUkJE7Q1Xtu2jgJfItlRRXCHJwXqIFYIutvEJmYQej
         KSTRcetKd6Hsm9H7z0A525KIeXFzamItR5jVrGrgz7a5d6HALLYanFWwrzut66E6Wa2k
         9oSt/jz/ENk36ECOwLOqkpqlo2Gao0GUTKGUM5VExqbh6yNbp+O61r85OLqDapCUalvf
         njawpnKTPgMKQL4lbYdmp9N+Uy6R2PqelhU2tvJm3wh0pLxjcYAEGo95BYpcPv6BjAPx
         xiQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764671668; x=1765276468;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iVaDDj93Qsixiii7tAc2HvTx01p9MyhJSH+M1UmH+cQ=;
        b=bp3MF6wYiZ/FbROjoBKEpG8L5h9dF4ikNo0x31vuvs/RZq2UDLbB27psu0cpGhgth/
         K13KqxrL3P2Wp2dCpARO4ile99vowwv1NRazbYGuJUpmEhLbk7yOMxYhLrSxTSGY1k4o
         wcCBBZEAW0KUZLbWAJa3V1+NzNcnNJglrPOC+G76EwDry7H8LBfD5iLKrWNeZ4bTp/iB
         FhIvjFnCIbewZATtZzZUAQxcUqMtpyI2h5z3f0RpFXVO4cBj7/TDt8GzxHJBPfNHJ3De
         2aQJ+yquUPZXPV72ev9QdEXZb0w3t79UdvwLNt3kTeKXg1rHuTIW+OGgquA73IXyvhZs
         bEnw==
X-Forwarded-Encrypted: i=1; AJvYcCWQriQj78NYQ+FH5MqkoduR8J7L2AgoCQHpVvBToDLwLdqQVsq8b0Ar2L4TA55cO4/4jNfGQqrw7gWKIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaINgXo2vU9uwe+1Zc1+mUEEEnX8ijYLfrnykaQ7Ume6Bq/Pa3
	cuvdV7oOTrkR6aSUIYzNCjHSW1w3TJNsdMyftF2gjNaH2QPbzguxMEzd8YsDqGGxWnatGfUA5Af
	2quL+/Bg6+6qWXpkSTmC0V8p26JXLHpjj2jDYYZi8CvYB5E67qG25PC/SMrW6HEtJvw==
X-Gm-Gg: ASbGncvGLvqqPEyHYxs1r73miBsFUshD3o5w3lq3/30IuXlxwhEIFnwnfGGpPTNoOtu
	n1ON02eSguXak52HRmTnPy11hu9hY98iSCSF6rRSwV2EAXX8LoW0xUEbMofRqr4jC4FPTduhkba
	8+jzuaFHxD1rtg/xkvyqnHtOo1RBKo9N3NKYguWHcp/5H2qWR6DD8rM2ix7WENMAMWG1e8hlH6b
	/QYyM7ULZDxxWv+uLeaAuha1RGXVWzrhJwgByAqDlJSTgQso49pQ3A7Der3PCKkPNlcqlBVX02G
	xHwfSL3WZV9or2fOX1TP7QAYt82/QNlsXIk8+rvx0Rm4NVywYwFu8o/etf6sLcFiW/RS8y5vTv1
	979zt3jvSUPwgMKAdIZiYzaL4R4lB6M40qNu5id8UU4PbOODKJoeEZGM4Gr+phSmoC6M=
X-Received: by 2002:a05:622a:206:b0:4ed:e2dc:dae4 with SMTP id d75a77b69052e-4ee58780ccemr419965471cf.0.1764671667793;
        Tue, 02 Dec 2025 02:34:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6R2Q6T4uhj/5AKTr59dwLVq7SMProZCh9NMSJkGjFh1CQsE6BWuFzsz9E2M7yp+Ac4HS+Xw==
X-Received: by 2002:a05:622a:206:b0:4ed:e2dc:dae4 with SMTP id d75a77b69052e-4ee58780ccemr419965221cf.0.1764671667164;
        Tue, 02 Dec 2025 02:34:27 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5a5f979sm1459361166b.69.2025.12.02.02.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 02:34:26 -0800 (PST)
Message-ID: <6030bf44-c239-497f-811d-2afc0e5aa926@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 11:34:24 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/12] arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
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
References: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
 <20251125-judyln-dts-v4-10-a5a60500b267@postmarketos.org>
 <09e5d84c-39b7-45a9-b7d7-9beb54fb2f3f@oss.qualcomm.com>
 <cb37445326732dc1c17e80d245c8a29ba3f5aee6@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cb37445326732dc1c17e80d245c8a29ba3f5aee6@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: CyNiruJY_C2trOqYe5o7Ha4epxrtxc7T
X-Authority-Analysis: v=2.4 cv=Hq572kTS c=1 sm=1 tr=0 ts=692ec0b4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XKEg-W0rSRFBAHshmuIA:9
 a=lqcHg5cX4UMA:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: CyNiruJY_C2trOqYe5o7Ha4epxrtxc7T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA4NCBTYWx0ZWRfX1ZRrbw0L3GK5
 Je0Y/9HrqwWFVN1uTSJY1Btj3G7U685GrSkY/DpI7Xhwg4DwEP4W9HVhSvpJhv5jbDoIOzLvCEK
 VNcNbgiNr/6VOBMZKsvb66dk5D5E+LReaSZWYZPHBGcobmR+1hB/PpjyzhCQNJMObwkE/3f9po+
 ttfcaMjvvPGbCtjwVxwXRKS1aMmBY89Jez2TPMtLHYCtXPNSe/sw6ybeskHGp4Gt96vFcoY+FxB
 Mfbwrbc8MBblRK+n6ULr4UmIjzaFfXcK9H0i8r0a7vv2p05PWGHI2usSheQOrCW7ZSBSKQWaBjT
 7ltKefko7Lxc9aBuy84eB8T5Am+qJY97z+hlDeRZ/bFpeM5t3ryjPsIA+LD0hCtCktR9vYbJsH4
 PyJGKDSoeEogyBWk/Idig3zw/lV1BQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020084

On 12/2/25 5:21 AM, Paul Sajna wrote:
> December 1, 2025 at 12:38 PM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com mailto:konrad.dybcio@oss.qualcomm.com?to=%22Konrad%20Dybcio%22%20%3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote:
> 
>> Sorry for not responding earlier, you can retrieve the actual volt
>> numbers from the hardware by reading
>>
>> PMI8998_IBB_REG_BASE + REG_LABIBB_VOLTAGE = 0xdc41
>>
>> ibb_uV = 1.4 + .1 * val
>>
>> PMI8998_LAB_REG_BASE + REG_LABIBB_VOLTAGE = 0xde41
>>
>> lab_uV = 4.6 + .1 * val
>>
>> Konrad
>>
> 
> I found it in sysfs along the lines of your previous suggestion instead.
> 
> ```
> 1|judyln:/ # cat /sys/kernel/debug/regulator/c440000.qcom,spmi:qcom,pmi8998@3:qpnp-labibb-regulator-ibb_reg/voltage
> 5500000
> judyln:/ # cat /sys/kernel/debug/regulator/c440000.qcom,spmi:qcom,pmi8998@3:qpnp-labibb-regulator-lab_reg/voltage
> 5500000
> ```

That works too

Konrad
