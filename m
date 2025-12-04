Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0D23358A6
	for <phone-devel@vger.kernel.org>; Thu,  4 Dec 2025 09:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764840232; cv=none; b=HCqijIAL5Ia+7UqEJBH0OKXN7dRYqXW3PhkZUmSRZrjArnPd1S3DGflIawX2DOwrT9oVST2pLdldnhbvCcvkvR5wdGB8Oxz9aN/eqq705XMKBbHxSSf7awiMxrbc3SbnhPxlgYxc+dA/0nEPHOb0xTvtQDauJHIwwWrxKQFiFBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764840232; c=relaxed/simple;
	bh=8LDTB7qwlwAWpewJSCzfGbc0gtsr0MYZZ2jFMrEIZvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q2d4zriXz/BP+zC7ySrP/j3kYtyPSruQb3shuSjYjSxsdRQhI2cI6vS5vnaTAD5Ul1dd9BLEoIQ1sk+QgvukzxV77FcBk8SqKmNe7tHKM+pK2TAi0OYxA6h/TrizvS8Xrn26M4BHkC3fB2BPe6/90+lWHb72E6P0MnU9A7WnUsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iP6BX6/Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ioH0rw08; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iP6BX6/Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ioH0rw08"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B47U3Cr996800
	for <phone-devel@vger.kernel.org>; Thu, 4 Dec 2025 09:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mGO4GwZ2ZmjVvhd33qR3nDXmMTKwXE4HtgsH3+8wS5g=; b=iP6BX6/Y8zIgk8d3
	d0kpoW03w6H4LXR8mw3oyQEgG6EeX2JSvW8XQ7MWh8jKQoG5h7sS241tcBKQjGP+
	sQcLi1C2jFjcrE44az9v0RSP53VOdG63dUhKG4+earb6YD5C0zM1I8hnQqjH8qVW
	AjBdIn6+O+1mlwc+i1Um7b4R8VjFLsq2bPTeg72CBtdYABiNfmCfCYsQNoR4zbW5
	UbnjtZEVjN8vx46vQJW+tjd9iNlIs7t6Eq3oeQE+CuNM7Bd6VYmRJ2DNx4A3Gx1g
	t3RG06l+sjMf9YESxWdQPWE8j+22yRV3+IwCOJ4QsHNC9dyecJOwPjA8rQMGS/UC
	Kunvrg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au5yc0bc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 04 Dec 2025 09:23:47 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-882384d1cc2so2259336d6.3
        for <phone-devel@vger.kernel.org>; Thu, 04 Dec 2025 01:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764840227; x=1765445027; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mGO4GwZ2ZmjVvhd33qR3nDXmMTKwXE4HtgsH3+8wS5g=;
        b=ioH0rw08qbjqoL7zQxiLjZKNe+gO45lghJVrCotrNodwC6ijF6SLKmTyGce/ZWyR3H
         5VeJVlcX4NoKzADgvTJDMU9X+WO7NxDDXgg3n2R0SKHgbPJsRxIJw3Jh1po39pYk/U/o
         eqa2IrSwmgw9w5jaehVur23f8GesO+qKEJCPsxuY/l27eqVJTlcdSuGG94ktrYaTKUeU
         aXyT9ZESxjEAdRmyAJrYar+/EEKg5WVj0WQ0avYoov9m77vPztVE9vc2by9KLd6r/Bgf
         vHevNOhbpwZgKJIzZ4ZO8KhvTmaU5pLceiartaws3pVZOxc6KtOoeguGHiO9ccEvMtdx
         oYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764840227; x=1765445027;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mGO4GwZ2ZmjVvhd33qR3nDXmMTKwXE4HtgsH3+8wS5g=;
        b=LaADuPiu3MlNrvyBV07tVk5jrCMzOx/y2m/wlkT4XUuNKEKXsCPyj9Xr86Oj5PWH21
         9ZyvVzuynnLGpWFrqz0EZ6Vm/kAieAmhOG/TCuomnE8syu8STM8wswqclr69k8nBj7n2
         xCn/B6o0ZaJv8r/38uH8XtQBsaXtMBU3J0zHSOGk1bYFDUyYgyiO+obAtwvHasKHWs8D
         kuogfFpDqug5hATskjfAgGNxvKRUWKv3TxolcQRSWyW6jR4F04uRPz2NkY5YTXz2Un6X
         yGXAs5ctH5mFXDfE+aY6CnkbM0Nh0lqvrB7buGhit3wIoqmA8n0j+8G7G8WGn8kP47ei
         IkmA==
X-Forwarded-Encrypted: i=1; AJvYcCWSmmkxqxZIwxgHAvTtZKtzyzHSUKfyKUyY+SwdX2ebtpcE0fZkWlsbmZANxbQlPZ315R79feyhvrEQ7A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7+jGYvOV/ogfp/DAtx+Exi7BE/fxWcZCoaxUJvMoE2ZI6xLhq
	2sPNJUexxxg5Xo9o7dcjd7gXrGJ3GYU9SRDMcuZP5wE6bdNiXw7jtC8KMaCPElGIfU7peTE0KZU
	yWAhTQbITLZmM6P5NLbWFJ2YbKiQN7+YBA9gLO/UAbwr7T9MaNzXJRch7aeVVY/PVLw==
X-Gm-Gg: ASbGncvo6pjBcA1ajSBcEd5jmO+7ER5YSNVhZHgE8TeGlSy9jNOZ3q/A8+fNKk3dgTn
	r8Bvb0GL0UxYVpnzgt8YqvsNbVKzkWWtDOfHbf0EDjACYorypgTg0oeqeEy1bTMhliLNel/rnc2
	wVItnTNLeXVSNMmFqtJo1nyn7i8KzJ0CgsT2MQcQa4Iwk/uRitQIyOCr1btfqDhH3AX62Aq9Pez
	uenSSWYI1Myj48QBUoquJpcOVbjkJervhbVbVTubguG6Hh7qxftjVW3o/Fm39ZFhkDKc4M4krc6
	LMk/aXWE6rc/+vj0DrLfpSeV/piL82qeRFe1rLDwqBLFH1l0324M9mwAU5y19TJWNq92HgWCnet
	mubejpTbTR+zpKTvoWgbDxyDfqm6LHZps8VyFfqCiZXNAGB2HQSMhijUFUZZVKB03Pg==
X-Received: by 2002:a05:620a:4102:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-8b5f950602bmr458880485a.8.1764840227089;
        Thu, 04 Dec 2025 01:23:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXGfXkD+y6dZ4QG4VBqbyEm57rw9k7/t0SDAniIi6rCIw5pjk4PR4+hUO8T2h3SepkC3e6GA==
X-Received: by 2002:a05:620a:4102:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-8b5f950602bmr458878985a.8.1764840226642;
        Thu, 04 Dec 2025 01:23:46 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f449d181sm86339866b.26.2025.12.04.01.23.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 01:23:46 -0800 (PST)
Message-ID: <7c0d4ac2-148f-4061-93f7-14ef49919c4a@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 10:23:43 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/12] arm64: dts: qcom: sdm845-lg-common: remove
 framebuffer reserved-mem
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
References: <20251203-judyln-dts-v5-0-80c1ffca8487@postmarketos.org>
 <20251203-judyln-dts-v5-12-80c1ffca8487@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251203-judyln-dts-v5-12-80c1ffca8487@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QstTHFyd c=1 sm=1 tr=0 ts=69315323 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Gbw9aFdXAAAA:8 a=fUOaoUbRyWbO0l56wzoA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: ZvyT71svGgRoWJxPssWlLBvB5VuONq49
X-Proofpoint-GUID: ZvyT71svGgRoWJxPssWlLBvB5VuONq49
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA3NiBTYWx0ZWRfX9KmefOoDLQ1x
 EISVOV1kxtStnweKPoK3hQwDCEW8QMPRh8MsAOIEMRso06j9Fb1H6iA6+B9bsSGfRL5/O5EJptI
 20O7uI/PnJtucj5ujs9Mrj3RODrzd5dL/DKpO26/YdmIr0eSP9AkhCrYG/Ep/hpREciGFuklvFW
 j5Sg/ZWQPrQpkYIY4WAUs3mC3XTbeXTHyKuRtEShH5oxu99jGzdptodlQYza2bWpW2NIhouScHF
 cJoDujFwayYzjdHYLee5iZS0p0sJDVFA0gyDEuJw19v4TwmoLRbndWG0E/k5IHpCxZzTVJtFUFE
 oEKDoBUlfBFPnbXlGBrG5vgJUo0t5sOIhYDWgHXkAe1jr2XawR59c36k8bcDyxy6/fYQR+9yH4h
 dWPHRpKL1JQpSxGsor2aK0nDw9E/Tw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040076

On 12/3/25 10:41 AM, Paul Sajna wrote:
> It causes this warning
> 
> [ 0.000000] OF: reserved mem: OVERLAP DETECTED!
> framebuffer@9d400000
> (0x000000009d400000--0x000000009f800000) overlaps with
> memory@9d400000 (0x000000009d400000--0x000000009f800000)
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---

I think we concluded this doesn't really apply on -next

Konrad
