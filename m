Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0BE30C35C
	for <phone-devel@vger.kernel.org>; Wed,  7 Jan 2026 12:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767787564; cv=none; b=jwCjQl4D8axR/ibjSK5u36fgpaGydnBkq5C6j5wZD9Sial7aimVTPZdxuvgxBDxGPiZi4G0wqvW7thiJJe8Z/D4fSdDIyYqmcJlPXNMvktVgWGfWvd+q+8bHGPSJ5uUiUhfLSxGF4cIptTHctjapvfu4YANKnwMSjxbVcacX5oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767787564; c=relaxed/simple;
	bh=SK1HMlhRdiA20hHT3W7oXbo+85GakTtSzNWoBYWNyGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AHcSaxLkPrrogKACSvMZ01+B/ROVXQBls+5brAmsQ3AAyLtu8sCTPGMff5ahYWHXGJeWW0IYWfGZom6wdbVOWKVIK61IcFHAVRcg9slgpZw5ZoHZMz8sTdYSm7HyeL1gHHk1IggZlZGSXQ9xMfg54ABFu83IQPcBx6Hi38oIQWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=at9slPrB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fNy7i86S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="at9slPrB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fNy7i86S"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607AJ9c33888906
	for <phone-devel@vger.kernel.org>; Wed, 7 Jan 2026 12:06:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jXpo5Dg7VBQka9vAkpK/fsgMzGFmUOfdUx5/PD+SJJw=; b=at9slPrB6UQC8Iyg
	yEkBgioEnmvWdbfCKfZ4YTh1l5f3OfCW7/9Q8PI/d/T6ETktHhYmHEXGkDM3kkyT
	8PeCCtbsQFIlMBlcc0eeEXbJL51Zvqt0Xhn7FBgzi9MhsgIxd/bjJHipsSdWf0nC
	xu/ts1X9A9Bogv1t2Yf815KjQrVu9dQFUoG/JZ5xKfs+PHN803zsHyANb35Sur/i
	BZoGWBPeVjQGhK7AaXQUSlQ5cPc97i7m99u00deEaYNsa6pssPSnDNdTdyAaxO0H
	wJ9JKKLl293kz8tAsvuCDNVBoj/QUa9D/waCaHyYGChdHdXJrBCGs3iFFXV6A5Ij
	lSCBrg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh6a0k7gv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 07 Jan 2026 12:06:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ffb8ac2cebso1113531cf.1
        for <phone-devel@vger.kernel.org>; Wed, 07 Jan 2026 04:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767787560; x=1768392360; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jXpo5Dg7VBQka9vAkpK/fsgMzGFmUOfdUx5/PD+SJJw=;
        b=fNy7i86SjSqaf6rTnrQ30SQv+FXov7+Rlh+gRAxGGJOPMxaCYmlZoTwblunQqCi3wq
         uf/+ezyG5gca9P7iXavKEFErahK8CwgLJmz4pYKUovUOU5FbYi0v5Y6vKtSNx1It1a+P
         Zc2dsUpBCRYQpClsVBOu8zgM+S2M6hcffUGAF+6m8dFEFA4/ZF8xagW1CBHioVF7pWgx
         2Dy1UkuKRrCig3+igX1ojgKXPfYf5egdxvLp7hqwicruAeLPuiIXYvkhHDQkjJ1cA/8p
         wnMTqCmb+6HIsN6CUDNy2WD7vZDe3jAVbX5SntD/UoNE5uGiWCDJv3DpJhv4W7eUD+II
         n67Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767787560; x=1768392360;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jXpo5Dg7VBQka9vAkpK/fsgMzGFmUOfdUx5/PD+SJJw=;
        b=Hv+SnKHWmptmlDqAKwfLDOVuIQSUnEBe/a0ymlKza78mID95eSNQQOWoW6qPn1K3Sy
         jXuEV/uTm+nNnrlWn6Rs0biJ3Q6DLpUacl6CbpjON3r+uk3YYuAfRYVzV+V3sc89PHXJ
         CL/AwjW4uX/5YHmFNwgnQ7C6syzEMoFLacbICxZOaKLsPN2jiL/LpCjolEmvHe35Kh+B
         HIjYtUfHJ58E2tiTqLd23JB8FRh1srJBgmqEEH3zxBNeSsOivfYHlkA5vn/0AwgqjOgd
         qNNwTQKYJaaZOUv0DSw46GNDnlj20VHpwvZodv6yrRAz9sodhmlBmGwuf+9Q/4CAQ4Ms
         P5cg==
X-Forwarded-Encrypted: i=1; AJvYcCUmJvw0g8ThjpGwn/CX/f10cJ/MDtzH994EHpW1CeENpxKLv7fFV+vYe8qyNlDeHsD6X3Q1S8CiKa8pHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwScPQ/aR7wtqnyi0pPS4o9vSOzKt10I6UoUhOCrTSkry0v5IKe
	M42zGg00llqAa+CVKWpirl4SeSolBul5jAmcTapHZnaWcYXsnX/fIo8uvxQhajsO1yds86PUkv/
	G80nzO3O/T7m+haFJQTdRRmKXsniom/4a2IB5g74PTWwrOsAOv03uEkVpcfet2867uA==
X-Gm-Gg: AY/fxX6GM6ZBeWpD0IdDrT87R0HmUc4/wfscAg9x0R2SQG8vOAz8jc181StHRriMEdu
	M4Izg9pvo4CLgHVrRAuAjg//dwn+/EKBWQWtN9BV0fK54QOnERHZXjpFhYzbP3gXiUP77BFSbKq
	Q2bzwbUDP47QmaS8vRrjx8xn94161q04lFvOpzUcDCzvu7KL0jRu/nWZyel/cnssTSLRO1qZvkL
	VIMGLEoJsa7DyHmQod62OtfBRTN7/7VTvRFmZN4a4d9r+UKC0SFnayqCR4HFzvcSDnDCylBTzpT
	J5x4ECblaEWhhP02olie0sHEQch0woITnp8EIMgwejkqOozjeR+UHQzt6l+YEK0FpAza+5SnLJq
	vGy/a1+lx8mxtRrMvvGuqIoTdl4mZrpQ36YR3GFJ5PXBg6/6pmerUvhjLmPE8dxKMV1M=
X-Received: by 2002:a05:622a:143:b0:4ee:1c71:71e1 with SMTP id d75a77b69052e-4ffb49f6dc1mr20250581cf.6.1767787559794;
        Wed, 07 Jan 2026 04:05:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTQzT9CN6wtGfm2PwlCCl6Gn/aZqv69AlP8pq+ElyIV23BjgSIJLrBUuo0uDBcmPXkR/JTIg==
X-Received: by 2002:a05:622a:143:b0:4ee:1c71:71e1 with SMTP id d75a77b69052e-4ffb49f6dc1mr20249971cf.6.1767787559186;
        Wed, 07 Jan 2026 04:05:59 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a27c8f3sm491325766b.16.2026.01.07.04.05.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 04:05:58 -0800 (PST)
Message-ID: <477fda29-7470-47dc-9325-c7226b77cd1e@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 13:05:55 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: milos: Add UFS nodes
To: Luca Weiss <luca.weiss@fairphone.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org
References: <20260107-milos-ufs-v1-0-6982ab20d0ac@fairphone.com>
 <20260107-milos-ufs-v1-5-6982ab20d0ac@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260107-milos-ufs-v1-5-6982ab20d0ac@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YYmJqdZVHrUlTpvtfLSmEwG7ZRDKudRC
X-Proofpoint-GUID: YYmJqdZVHrUlTpvtfLSmEwG7ZRDKudRC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5NCBTYWx0ZWRfXxhMtAWxdsO5W
 rR/+22Cy6lQv6wYf8NrzVr6V8+H5Z1/M4CDW25V75UyOzgoM8ze7HsVp+mT0/FFzIelSk4S6EZ6
 h5yUlzVvzMAIiMlaJc/blBvEc1cYPWN2I+vo56rGAQBO9u5RBO0h63goZC0Uz8I/DKayDSi6Pnh
 PMdmvcM+4u4uoRrp/WolTgTjl1+113y0JF998qSHkELVhClcwCdYQPHk0/THgZl/3oGavYb6Qnp
 msjqg9QTSNcj33FvgVmd8NPgo4bOCZnyJHCsdWMTZ7vxDC3LnRXQn8yKuD/l7l5HJzrBmzxPqOh
 FPIf3zicZ6zIy6u8n2xERzsw21DLWMwz6x5LTMiuvO16nOQuEyewzBl++GOqMm/GciWAOgKmxjP
 n6hwqEoBGY0l+rhtlu42aM/FxnadzMOGZ1PdM+rmOT2ionrWMLTXQHdOAzUksvn7kWOGkT7vySi
 HjfpfgaCaFdhgClmUBg==
X-Authority-Analysis: v=2.4 cv=MtdfKmae c=1 sm=1 tr=0 ts=695e4c28 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070094

On 1/7/26 9:05 AM, Luca Weiss wrote:
> Add the nodes for the UFS PHY and UFS host controller, along with the
> ICE used for UFS.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

