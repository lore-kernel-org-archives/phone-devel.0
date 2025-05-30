Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FF713A244
	for <phone-devel@vger.kernel.org>; Fri, 30 May 2025 22:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748644573; cv=none; b=CXOsJLwzCDZYgUrFF7d8uvSpt7PZRIaBlBH65vDz+9QqbGD4ueOI3tSg+tbNVN3q5UH78zYVcqPfsHuEFHRyXD+BOrcNy3MSumRf5RWAWcDLVW62DEbKd10jP4mn57MVkducJDx/fDA59d+nFjjGKVH8mvMk3jSfICF2/aXRJ14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748644573; c=relaxed/simple;
	bh=xGS6k4blEjy/i9Daac7d4JV0CcqtR97OXUHxEjcdtWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q9XsyzFVumJdf4Umx61JQqMm7jJ9Yj7k7oxemYjU7Oyc0O8ybVzLe0ogD7baTUqoMgzohf13zYEUQEsQ7+njEhLFVUHdZOAxte+el0OHDwQiQcOclBNYsF+RVD3LunpfnvkW2yZCzEmuYBRtLvJoO064OpbW1f64TD4aQ/lMgSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hOPGBC+d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hOPGBC+d"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UBoTRx018216
	for <phone-devel@vger.kernel.org>; Fri, 30 May 2025 22:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oNkiIfiTftNXJgdiuHT45+fDScK0Exk36F66VVHtQi4=; b=hOPGBC+dzZz2J2LW
	eaVhf+vXxwjvSFz17q0txgp+yESeVz0ecMaYP2pJX0DGig43UY+btmCONH+azc4C
	DcdBz40pPL1HJYFAmYZpCiQhI5Jjb3Apb4EZ7XDOFkGfvhbUrk8BFZRlyybY0mJU
	eF2uUMgvEUWKLy6mOrkYBSYetd27a5g7oxK5+58M+Wj7O+HOmyG6+sma2vArmcJE
	zM4Rlf/yl5K7Zd+MuW+yD76L/9tMCyGPSaOssjVf05MOCsZAycWWOFC7IWXfCesw
	Z8iBvY31sO76n6EAbtw/Gf4XWBtogzd5NasEEKHUG3RbfN4agrx+HLwKdB1pS4be
	EFg2gg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46yc4ysr5m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 30 May 2025 22:36:11 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fabbaa1937so7094936d6.0
        for <phone-devel@vger.kernel.org>; Fri, 30 May 2025 15:36:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748644570; x=1749249370;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oNkiIfiTftNXJgdiuHT45+fDScK0Exk36F66VVHtQi4=;
        b=ujSri/0PNR8sfl/W9QiDAjOEVSeBaVE7jCTyIXVMJCa0dUolnpaVCmR49mReOJkSHw
         CzG/5UwE+074XEEDpk6xPF1RBtjG0FrUDR/n3oNglajrmrolyG6O6hJ5dhe2uquoCLRL
         mUSOOdWTxW38n2Dg9OBkQW0nZxGSxZ//tBs8NEpFu7XDhfAtBN2fv37XC1UNfkQqZ7dD
         hzXG0d8+5G3wuwFuJeiBqQwf2ofJLKhMjDQ8UiC1Sml9IL2OSpSwzqhMDkRgMMKE1ry/
         iFDNiRwq2Hn0A17+aC/cyJbkTF90HngBaMLh8CTSAB4Ls2qB8rm5I7xpV0YMtVxSkiKH
         U6bw==
X-Forwarded-Encrypted: i=1; AJvYcCVBVoot/86kYZv+hQDDPhzosGVHIMStYJeJvlMCles5N572l/lgRD+ivII3FgHbxYT9MQnFTSrqrXu6zg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0pvnAPLOoUrmIM92wpERFWOpSHoLEY0y+48b0kTp/78iTUJnR
	bcuiglY6p+T52eus+Klozaq+6wv2qZIOXZfYAEuYaJmBSoq4Hk4yWFoQ+82KXL2RDdkvA/907i9
	VmTWZdubV2hgdCW0fuxhLHAsW+44dmFREpErHxkdcMX5VvdhEbZv5WJqh4qoS0XFBdA==
X-Gm-Gg: ASbGncsnx/x9vdFey2aPxqq6EoJLUOLmbQHjV/FlZwI9LbAwH56U1IfXlgjE9ApCmUC
	cpbObXh7Ce+w5hCzYBQJ5t6V2gdQoU0ED20X0a+XUcKHkwndd+be4ZvwXAmkKZrmG8kwWGv+NCW
	5hJMeqlGHDN9ctVcFREAtuR4jWgcBsRoY9Ua2E3A5Sgwb3WPbe0iLlL7x4IqR4LcakWqlOfQcUG
	vkpQnG8rbPitekrYu4xbdL0aEiYgKGe62FJ3DBxIiXg7xE2I/ITi9YWL9eqGFFkAQtERGyeU7PV
	4ArKMPH46J3KQZjM2UUsS7t8VRRAZyVvawopHqsnQ+wuKh/xiZyyzmTqpCZGYpxECZrz17Jrh/l
	O
X-Received: by 2002:a05:620a:2a0b:b0:7d0:a00f:3583 with SMTP id af79cd13be357-7d0a3e0f2a0mr241773285a.9.1748644569822;
        Fri, 30 May 2025 15:36:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpR5ujleZaD69xfTnf0iaRv5b46kYN8mhROKL6XszWVaQ/FlxVmb9Go+0V9OPlLv+rfLSCqA==
X-Received: by 2002:a05:620a:2a0b:b0:7d0:a00f:3583 with SMTP id af79cd13be357-7d0a3e0f2a0mr241771585a.9.1748644569450;
        Fri, 30 May 2025 15:36:09 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adb4292ae03sm57383966b.80.2025.05.30.15.36.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 15:36:08 -0700 (PDT)
Message-ID: <20d0e138-1b35-49ef-aed7-b9d37fe8d264@oss.qualcomm.com>
Date: Sat, 31 May 2025 00:36:06 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] media: qcom: camss: Add support for MSM8939
To: Bryan O'Donoghue <bod.linux@nxsw.ie>, vincent.knecht@mailoo.org,
        Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250530-camss-8x39-vbif-v3-0-fc91d15bb5d6@mailoo.org>
 <20250530-camss-8x39-vbif-v3-2-fc91d15bb5d6@mailoo.org>
 <e28b518b-26ac-4d3c-bfaa-21a7cce63366@nxsw.ie>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e28b518b-26ac-4d3c-bfaa-21a7cce63366@nxsw.ie>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDIwMiBTYWx0ZWRfX0Ly9+fRsdm5b
 jKNuAFJj4GvP8oMuruH9KYbMbSivizKhWACTkUYmlJpS56U2DuaK5XBL1U1htmibYiA0LRgfizn
 4bgKP8c1v7N+qsY87icu8N6PmUaF4ERW0kwW8yORZBS+2jE/GwcUeL2guXd+IDXZ/q2hhBP9EPS
 LjIk17S9TjZNeGcqi6C1WXybZn1pNPaVWvreAlgqQUgIX+mEen8m7KZl14iV1c+wYklCx9V9xmz
 UV6n4+7vYoZSzb6ZnWmdF0CAxeTlj5kmBmoVmxrfc2AVHQWZa+eXCPzU8kV+g7Aj+ixnfj/UMtv
 NyT7qeOqstKmmed2EqJCYi8+P124YU/MWilTSX/nwrsFwf45d6YghjNGS/qkwV8UsNT+JroT9vV
 XH5rF5idjambr6o8w+EBpOsKpZUdcrj6uM8x9KzZcSZqa6J4no/R2TQ6V2rS6j9TVh0X8N7s
X-Authority-Analysis: v=2.4 cv=Ybe95xRf c=1 sm=1 tr=0 ts=683a32db cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=okvWR7n1QOkNPS1Vc-gA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 9cm7TzWeYA1HQKejxXhcEa_K9S-imDB7
X-Proofpoint-ORIG-GUID: 9cm7TzWeYA1HQKejxXhcEa_K9S-imDB7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_10,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 mlxscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300202

On 5/30/25 1:49 PM, Bryan O'Donoghue wrote:
> On 30/05/2025 10:00, Vincent Knecht via B4 Relay wrote:
>> +	    camss->res->version == CAMSS_8x39 ||
> 
> This is not correct - it should be 893x since 8939 and 8936 are ~ the 
> same SoC - probably 36 is just a binned version of 39.
> 
> Anyway the x is the least significant digit.

x here is the modem config, but we generally agree to just use the
most obvious representative, so 8939 is ok

Konrad
