Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2818F32341E
	for <phone-devel@vger.kernel.org>; Wed, 17 Sep 2025 13:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758116689; cv=none; b=jRYfRSJg3v8qXiFnLWnymvYMrrKY8No4pseqBSoE7wp83DgJp/kCjsAm37J8tl0AnylrgxzLNE9RQ4BoyT9Fs2QhAZwrC6TRnyi3yQReUoG1n9kbTkAkkQWxNKvAejTmnd1kb7Ra2NQhB/qkofPBWZaBsitYy8ybIgMESVpPuyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758116689; c=relaxed/simple;
	bh=vUQvMzwQ3ZD1hwhkE21bB2D3wf/HfeAJ/XRGoPgoT50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c47rwDvqv0BusqhlvKdhlwh/It0RV1q/lc+bcs7r93oTArtPNtOpIXb0LkYJk57GT7Um90Lsubux7Uc7IwuyrxJpJOm+BdV4v8DdXnwFex/MpNIYVMR0wFWmQtgeffPZxqP+W/s7pFCfX8a9pnMpP9TV7/MtYvVJz42tfhqfOXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ctPjgPV/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ctPjgPV/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H8XYPZ018228
	for <phone-devel@vger.kernel.org>; Wed, 17 Sep 2025 13:44:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nzSq6p8Sbr7XpckIwbd1Ueyncy25BkLwVzaplFhdajs=; b=ctPjgPV/kwfpsGp7
	EVBu+xn9lUgayfxTnG+Qe6j2XX/MPJgu15evRp7QuwSwjp21zwuseFjptpJqpqez
	DOTEmBZe4KyqQ20zgUEF5FORo+XyhyI3OdxKC5iVF7OsLVRdP1/IpE0XFcHSlpTy
	6J4pIdR8WyJXbKn4IOzE3E5RGmt1pBVltGoyfQ7VVm/I+TPFjb9RzJu24b0+okn2
	zc+C8kgdX5BPXPcdsCYVRKZOBAvOpQ1TJ+9WAVq3nzBvvPhYOv0nDZ+KehrZn1sU
	yoYGZ29aps9OM9MhU2d7jJTrEhSiILZ+Dh/ZU4yVgn/igeTOADQNSIyrOJ+2ZUeD
	JKvsmw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxwahe5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 17 Sep 2025 13:44:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b79d7413eeso6520221cf.2
        for <phone-devel@vger.kernel.org>; Wed, 17 Sep 2025 06:44:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758116686; x=1758721486;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nzSq6p8Sbr7XpckIwbd1Ueyncy25BkLwVzaplFhdajs=;
        b=aacuJR1UsS/RKY4L9468FbK3VAKEjGTv4XyNJfl4jZssvy0x68W/r0JE+6UNeonCq+
         EqxZ7nHVNDkLVM+Dru9SVTlvvkkowQNmDiHA7wyP2Y2cQc/PPiUwA/k4WcxdNKNYl9mx
         8SpsxGGjmX7zxba/EUYXXyYf5Zf+G4XT8gSxH6qW1dhecr0XB7TWzE84k5SHQuIBYj9Q
         YG3dE6gvJV3se3e0OAAYcL/60x8vmSHE9CIfQGzGV8U90fi/fyuuqXqENf1FQEH0iwb6
         SrB7jzppq0x27ny0EweITZoDitn+DtAjudHtJEUjw/F/IekPHlLuLGo6ofmeLZAzRnQb
         XSvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWy9R9+2U8nZ0jG6SgsTVXK1LDE0p2tgs6C6qTk3LV613oF3Luqd6hENASfRn5aQylzd/SN2UcFV+QTlA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxap6d7T873ba6p8NcjaClpAd3ubI0hRoJMHWLsoOxIeGS/5JMe
	NcCdZXsvHz6mgmRnXFGbBxPzvM9ArYCakO1Ol1VH2+oemYX9hMx0PJEtyOFfdvmpTbfSFAZxkV7
	gnikjkg4FwNLY78Ba2Ze7oct3+tlBgGFrCrrh6aEroMhyz49SoEfyaD76OAWz4EyyBQ==
X-Gm-Gg: ASbGncs62YUFYHSvxJig30B/dqdgL/M/sq3b5oKfcR/aeLEwj4Z8sAlis4uyOuIQIyV
	vbcmCoicAlSYWneMblYrxFcLFsuuo2rXrt8KhUdPjdSrAwvnf0OpB3P7nI5YNmuOyvlf8cWoaQJ
	Uo2/MK9bCaxManQRYUznz8oBjSD0tyGaIxebzMGKAGjwzAAkh4GScGfN5b362VAsAh3WppmUEBR
	9fbVwnKdK8V+ugD0ze+AZdRGlpcRwH18H++hQ5zJsihzkHyQ1cO1Yh6gkIXpO5e4xk/nJsjsae7
	aLlkft65+KvX5emTu1Slo7PTFVQR9walZaufcvggfWU4QZBqc1mb1awDnMyx4Zv/CtzEHRxukir
	JbToOH+VxH+2XpB+kGOkGKw==
X-Received: by 2002:ac8:7c4e:0:b0:4b3:4590:ab6d with SMTP id d75a77b69052e-4ba6833f385mr16864901cf.7.1758116686117;
        Wed, 17 Sep 2025 06:44:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkIhr8rNJXDx1RAe7AAc2URQZK0PBlD1E0CbqMIoGy9FQdSRFRguiWp/NEMgT3vBZtYX2NZQ==
X-Received: by 2002:ac8:7c4e:0:b0:4b3:4590:ab6d with SMTP id d75a77b69052e-4ba6833f385mr16864601cf.7.1758116685387;
        Wed, 17 Sep 2025 06:44:45 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32f2122sm1376734766b.85.2025.09.17.06.44.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 06:44:44 -0700 (PDT)
Message-ID: <04b9140e-db90-472a-a550-b369670b02c7@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 15:44:42 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/13] arm64: dts: qcom: sdm845-lg-common: Add
 chassis-type
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
References: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
 <20250916-judyln-dts-v2-8-5e16e60263af@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250916-judyln-dts-v2-8-5e16e60263af@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HbIUTjE8 c=1 sm=1 tr=0 ts=68cabb4f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8
 a=xpcYJZ5K4HInNErYrfIA:9 a=QEXdDO2ut3YA:10 a=IQdlk4_VRkkA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX1MS+w51YXTFI
 CCBr68CsCrTc3+MHxGj8Vv/UWXgc6RZKDZMsEwHFuloBxWtlHqI+HZ094M93kuj7lek4sLki7S6
 2rNSsPbAh0ttMJo67nAvcUhOw7Xw4fIAt8Mbt3pUqXpviW7rL/qpTThysMXVqH+D4FFXck3+xI6
 WvCKHAPYLPIUz6c8XBMz/nBt6v9MOIvkOHtLSWUTJLMAfY+PouG9CsVQZqz1vGJHUB2bhq7q59v
 q7JBYHM1IWIoQRfLpQpnKi5AbVtqfu7X2gO8/64IfRnTsUFdmpdwKxnNcMIPCNfL1LQarGR+M44
 boK2Dyo7y9Q1U3DPCDhk+YBc9VowvAkYKfSgQN55kqvbxFJJqLIpkMMCp+qQc8pEyrToEm0epUg
 2eLVB79X
X-Proofpoint-GUID: YH5NyybEVsxSWxoEPda0xoos3zrThwYd
X-Proofpoint-ORIG-GUID: YH5NyybEVsxSWxoEPda0xoos3zrThwYd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

On 9/17/25 3:09 AM, Paul Sajna wrote:
> The sdm845-lg devices are all phones, therefore handset chassis
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
