Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5479C30E826
	for <phone-devel@vger.kernel.org>; Sat, 21 Jun 2025 10:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750500357; cv=none; b=Z/qCTNBZLlXkPosGUk3smHOu92w3Ayzztdhwgu12AN4IcyTPKR4SzasF8AlmoL/po5HikTA/yARlEQGvJJPsGTKsj1VzVT99sZIf4cQkmL1WT7ii4ea38hjE2ebImPbW7vet1tvw1vQKQrG1zrpGKLEJn9tnSm2mi94hcaF9g38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750500357; c=relaxed/simple;
	bh=Hn9VgER12ug63dZ6l8eYWyg1/ICuNU+YVIfUpFrL9jQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aqc6ygbzxF2C/myIrnPvbcMGySZas8nGRghAV9KjqFzWkUsQ+/df1ysfxhr1SOzQDk5Nal5Q0yMZSqZVWxO/MqKAOnGPg2IC5QcS8fW9i8av0lik/lumWvxGl4xv2WYqFanA0v77a9HAani+ndoI9fwlXBQf7nxM9AGiLFXt22k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a3Q/DNuB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a3Q/DNuB"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55L6Vw52017496
	for <phone-devel@vger.kernel.org>; Sat, 21 Jun 2025 10:05:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qfJxwg+l2c3JiL0XNVJZZ9SeKhv9FqmZAUKpxuPv/eU=; b=a3Q/DNuBe4NsTALU
	eHxGolCXqh/dU4eUoh4AwLwlidtt23wVf3Xd3BhkhJP+Wx8zWRZ3UhNBKkG2Rx75
	WFS5MSQ/vdllx4LP7MfVYWCA5VhCX+3OFHs9mG2Iw8/xNmgquykjidWqbmcHm3tN
	hPKEtXyFDuLnP116OrV7a/3UMz2wPz80rO7By/s4uqtlu0tTX83iL02ECjSUZTFf
	6q0Ci+IkQbpsMT2sObNnq2d1Gf8QUCpIDYe+Ek3So2EaNBC35yiZO8PVnRvbF9+p
	hu/CrQt4LfSzFnKRhO2GyXZBOdKz7aX8+nR5fsund8QNut/Fuw5F/JPjgQnk04Dt
	/xY1gg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dpg20b0e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 21 Jun 2025 10:05:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d09a3b806aso53986785a.0
        for <phone-devel@vger.kernel.org>; Sat, 21 Jun 2025 03:05:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750500354; x=1751105154;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qfJxwg+l2c3JiL0XNVJZZ9SeKhv9FqmZAUKpxuPv/eU=;
        b=mprmaQB0zfHfrOTv7UBAwI3GRXEYH+J/Dx7EI8EovLWe7G29A0p7YRmes605ak/WXW
         27wVQbAgPAVFxiqfTzpxA4QbQDv4NptW5R9zDaSq82IGg0DqIgJE3e9ubVlCXtvY1x/0
         uOXqnyFjnynVMO9Fg5siNLZEzKceVqxN9KswYwUxJERm8ihzwUMCUNiy8cMqGj//WotF
         Qe6s2smoX6dL9eBgfJrCh+m4NsfMBIeU4rhQUz3mwUUp9rkSKGHMDo0rOmxva0J6n8Uj
         mgMhMjPAbnPUIxbZK3u9yTl6fojyY/12cxCUTwXMxmmQ2+4O5yRkv7mEvRYpAQ2MTR7l
         DmDw==
X-Forwarded-Encrypted: i=1; AJvYcCW5xpSKJL5NTG9cEX0a8sCbSCb2wwv9bBtx9PvoJYoQetFMV7QQ8jRWufQaj0PpsmEVqacJ8ZwKD3lJ/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqqZ+4NjHovVCbQxRqXsNQzxo9nq5+CEOKe0t/rvEocas1Xn5T
	S30YzCz6HNacT1o1SYiN9W6LZM3FrdG2EoFBU0XGqy1ZqAmklZyZqkQY93X7WIuOFwDNB2hOSyC
	fSybO0bzsdF5IdShoQstUsYkIcaPPxhfW2PjmlPV0YdeNAQ1sleePb43bEwiBtSlA6A==
X-Gm-Gg: ASbGncvgjJWNysvFLAg7LwyGF+izmr4QbbfWIkU34rJ4tXQePJ51Ioa+56VcsjFz7Kq
	B+FDbJx8PPb5/L/3Hk1mI2fU75DN7WE4F0Md9K2G0XxH9hoe7gCDdbb5WMYNvjnI2+008ZnIPsg
	fRXAZiMdj5slJYYVUviTlhGSJh1PIHbkq8e3eZ0kchFl2wa90ZJFqpNsURajqqbtcPKWIDL814D
	0BW0Ock19oWQfSH6M+N4nW9+0DyzQsC0IbUABNNmKjt2oxoCfEKoBhKHx3spbia1Yc0S3i6r9Jo
	ipPTFvhzbfFjtC7lWURv3BPM7CIu993GIbfK5I9PY9YsvAgS6oO6ZUz5O1yDN5Md34Smqjyb+h+
	EsKE=
X-Received: by 2002:ac8:58c4:0:b0:4a7:64d1:1f63 with SMTP id d75a77b69052e-4a77a241458mr32278701cf.13.1750500354351;
        Sat, 21 Jun 2025 03:05:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5pgyeeYbXGzNX2jYyLlrGsQtTqE6d4IrhZZQuJtWfMycA7fDBUtRHDWtlBfsYFyqCgifoZw==
X-Received: by 2002:ac8:58c4:0:b0:4a7:64d1:1f63 with SMTP id d75a77b69052e-4a77a241458mr32278541cf.13.1750500353965;
        Sat, 21 Jun 2025 03:05:53 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b6894sm334915966b.111.2025.06.21.03.05.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 03:05:53 -0700 (PDT)
Message-ID: <6e39f8a0-c4fd-42d4-91e9-48ca1d154c6c@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 12:05:51 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ARM: dts: qcom: msm8974-samsung-hlte: Add touchkey
 support
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Adam Honse <calcprogrammer1@gmail.com>
References: <20250618-hlte-touchkey-v2-1-2cf188b57e31@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250618-hlte-touchkey-v2-1-2cf188b57e31@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDA1OSBTYWx0ZWRfXw8qRYdO8S+8D
 QtekMaCE+nfpLAh+ptE8GpS/7iSRhqzGBfjtNPDZ2OCdiYq0CDVw8UHJe/LTzrURPddImu/1jlL
 CNrLXKUvSdGbpE+cqeqB5B5hMoCBM7YzjGmmndhuNmvNWr+4xTGFOCluVprgHEPZqOpxegYim87
 sAu0x/Z6p+CDKHWhfEr0Qm8YYvaZJiwD5PemFAZHV0EPp3J5CEy/qQvmDhvfTiWAPDVTUPZLs5y
 afhcyVFylLbu8gLjzQQU7sjFJVZlasFcxEIiWhQQeBDtE3mEjh0enZSMBubM8Bg6zKMo89J3jWn
 XXUZLIqQFng4UKiXaAlnzjI/l0F9oByjZ40TgfncB9QP0dvLkVk+yhRnSXxjxbFa5YPYYz7yqDl
 I2K9GcL/fanwL8CkboJKcti0GU+k+hRhjHYTGUV7At0m/7DzUzoD3LHU0ptBHuJq8nhvupCf
X-Proofpoint-GUID: 37D8tik9nUWTeO0exhnsTxYZuXiHczcC
X-Authority-Analysis: v=2.4 cv=fb6ty1QF c=1 sm=1 tr=0 ts=68568403 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=dlmhaOwlAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=wwgquuRBh95SaqRAEc8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-ORIG-GUID: 37D8tik9nUWTeO0exhnsTxYZuXiHczcC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210059

On 6/18/25 11:45 PM, Luca Weiss wrote:
> From: Adam Honse <calcprogrammer1@gmail.com>
> 
> Add support for the touchkeys on the Samsung Galaxy Note 3 (hlte).
> 
> Signed-off-by: Adam Honse <calcprogrammer1@gmail.com>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
> Changes in v2:
> - Fix schema validation failure, adjust i2c-gpio node name
> - Fix misplaced S-o-b (hopefully)
> - Link to v1: https://lore.kernel.org/r/20250419-hlte-touchkey-v1-1-9d93c3e2b31f@lucaweiss.eu
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
