Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FD022A1FA
	for <phone-devel@vger.kernel.org>; Thu,  8 May 2025 14:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746714432; cv=none; b=TFZAjUjM8fqsz/TwNYJ5XS0a4XmN6KC/db+/n5yM5luqKf1nPF1xSwQuL9afwOFAs7ht6KvWhBKaCbRa29e/S7lfaZ798FGzQRxZnMk0+Fj4nlkwtAZ2z/4klMskbgVjE0LPZvxZxxHcdGKXP2pPy+O2CRGzxOXswRsM5GldbRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746714432; c=relaxed/simple;
	bh=zkds43o5L5B/f6HNVac68bbzTS3DCgZhRIDrIzr3LLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nA2pNSgxLhWWGKeYlest0fjab+qhbSZAbEvUK7kbp8TCOpDQs88jpm0TGIktCEYh9UF/e2nzTJGVXcuFhkXGhYqlEQKLBoelzR+Naq/KH3da253ElNqjnB5Mh2vyXQxPnCsN+9P1BSQbHJBzga9SDN6WFIAoVdWNOSgTKtrQeaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YJ+vvhv5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YJ+vvhv5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548DIOXe002148
	for <phone-devel@vger.kernel.org>; Thu, 8 May 2025 14:27:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Mep7YcpH9mzwrz4fqg9kB+zrqpI2pfxnFBXIq+LfRk=; b=YJ+vvhv5wxf0zoE+
	FRCfleAoKhwz/ZkxHGa7gIFdg+hImF8d+4z4jqa58MSCjADTch7h5e7j6kcO53CA
	+u1Z7UIt/pzYSvriICYPyOvGLh0SE2qPFXwMyBl5y2wmW8D8ht2IixG2yIXQBjNe
	7TSTZelW0DKwGJkTfF7NHntZZudKkmoQV6Ts8lsJrFXSw+IiLHLjHFtafjPAZ+7z
	U7qsVYO5xaDHf/pODUmle7MKIrCFNIzLYqufBDYav66HZwewUr5gWLMDphuS1LuP
	Qrij5s3zu5Z3thxgI9Tof8rRNJolzGcYyO0Qtw6mG0RMMEDkisgNLm8pd7slh8LD
	Hbnq0w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp59kbj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 08 May 2025 14:27:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5466ca3e9so25290185a.2
        for <phone-devel@vger.kernel.org>; Thu, 08 May 2025 07:27:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746714428; x=1747319228;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Mep7YcpH9mzwrz4fqg9kB+zrqpI2pfxnFBXIq+LfRk=;
        b=tqQ/rajHpRpx5yZwrcaz6ARkG4yVsdJn69kIkp9er4RWET6RMKW4dwiUubFZEuYR4O
         UzKEKGkilL3SW4Tmgk0DL5T01/gze2SFXiQJPzInV1u9vfan9Ice5m47vtwOzgJWvodn
         CAN+1m7en6qJQlkLkpLL3ww4MDpTjgQet6BC3B6Sz4mM86zEGGvIoAlDVCX9ZOBb89Xe
         DRydkre22vWQYVfoUkvcJYB3VkazGRddXCEJ65WMIdHnjDoWS69nuXOm6vM4ILdneq6+
         gTZtdw7I5VcehbTIY9+WqNwowzCHLJvJTG/riDek3xDQ7hj6ZNIxAaFqZCe5lgJfKQIr
         NCoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXb9xDMXoDClat9KVRBjJFT6JcMIYebuAhk1jX3k5H39CfN/4T0ngXXFtoxyTuhWwa3VLE90TZwx3vcJg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8pYWju0oUmbVArmr6Uc04LbJoqLnH5CV1gv+69Bo6zJsK0zOa
	1vrqlgT5dh0veM5pW3cYhTYBQ2lLpZqQ7/UDFmmJiBvi8RDrxh4xSi7UeOfcuNQfIGRJ0+4IdQi
	3GSP1upRgwnLcICEIhfBF2Y5fTz1K2LEsROCRqxxaY+KxaG23Q8AZkWaAZjU8n4A4zfFACQ==
X-Gm-Gg: ASbGnctvhBP/+w9KhHHTEyRWkysobGvbBrfapj4oEnZDcz37M4iwqfw+bmQuWod3GCb
	r2AyTPgBISSCpPirY8F+8Gtw0B5rAyGwdio0GbFDz8okQfTl057qcrcTTtfqbI75ynR+ZOJ+yqx
	zt/UgtY2pOW9DqlWmUs7rLPJyqpXLV62i80TFwTWpuDuHhbrvwFLJzZNmoyc7FjjVVlWuEe9WOU
	1kFlur4P7Tcu6Snp5z9R6jSHySY7dZJwNy35bzrzsAEU7GeLpHfG2OcqEl5b9gOtpPIo3rjTzpo
	/eKZY3TKr7FvF2ZziaTowrpbwwixYzqtVFt1GuCuMzuxPGlZTNL2gb39ScJ51T5t/lg=
X-Received: by 2002:a05:620a:3711:b0:7c5:687f:d79d with SMTP id af79cd13be357-7caf73aaec5mr405295885a.8.1746714428658;
        Thu, 08 May 2025 07:27:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvba6HeUAx7OKuoCqvOUbDJe875HzP+f08GjIi6W0s7XmhXMvoMzNxaPmK3JIBmw9hSJ9S6w==
X-Received: by 2002:a05:620a:3711:b0:7c5:687f:d79d with SMTP id af79cd13be357-7caf73aaec5mr405294585a.8.1746714428345;
        Thu, 08 May 2025 07:27:08 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad20d048485sm55528066b.127.2025.05.08.07.27.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 07:27:07 -0700 (PDT)
Message-ID: <f22fe0a5-d39c-4a6e-9363-d02a6b17f01d@oss.qualcomm.com>
Date: Thu, 8 May 2025 16:27:05 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] ARM: dts: qcom: msm8226-motorola-falcon: add I2C
 clock frequencies
To: Stanislav Jakubek <stano.jakubek@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1746711762.git.stano.jakubek@gmail.com>
 <5a8191e3758e0df78b4213102f25ceadc28cd427.1746711762.git.stano.jakubek@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5a8191e3758e0df78b4213102f25ceadc28cd427.1746711762.git.stano.jakubek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XL0wSRhE c=1 sm=1 tr=0 ts=681cbf3d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=TrkI-WLm7CqbamwRmuEA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Xi0XEAcoX0zmLp3ORKOnMzUjK6V19NAp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDEyNCBTYWx0ZWRfX6t91mpIzVNG1
 ubr4leb6jzJcUOZUoKaTNGRn/sI220/8FFXO6+8czE/G2dkpn4XlgV4dsRmkgc0LfAH/pGJxKdl
 YgcwgQbxtXYoBe7upbtAPZ2hAWraSWGWNfbV57EPZEjYKBeJBeiOSpT1xFrilcy7ua7zMKHEPov
 mbLMWpLEFUENzLd5dwXgt1TYaHmEiunGGlGf/U6IINdvtprPikOViAqGTf2BJFAPuloM8xi7gzA
 ogVhCu01ZFCokTEKQHCWy9mfkHj6h7OXc+sliUBQ8ItA0wooMrBQtV/xTHnLvvWBFshVZWz5HdF
 +/IocY+4cgW3YuUECwtNVheWOzgpJKsq36K4+lCOo8NS1UUzlFcVNU42Cg1lRu0E8OXpvDNpZti
 pKtBD1WqEUbVfa1JdaIw0xV59/CanEJ+MhwKJgTxJF0RESWpwZyk0KdHRkaUTBil4JxP64JZ
X-Proofpoint-ORIG-GUID: Xi0XEAcoX0zmLp3ORKOnMzUjK6V19NAp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 mlxlogscore=800 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080124

On 5/8/25 4:11 PM, Stanislav Jakubek wrote:
> While the currently supported hardware works fine with the default clock
> frequencies of 100000 on both I2C2 and I2C3, downstream sources list the
> frequencies as 100000 for I2C2 and 400000 for I2C3. Update them as such.
> 
> Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
