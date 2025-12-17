Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24871339849
	for <phone-devel@vger.kernel.org>; Wed, 17 Dec 2025 12:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765973567; cv=none; b=IEC/lWvn2nsbFloJt3fL0v7n/2X+l7F1oj2buq1/2uaX2inTFvNDtyW/EBHNMNBRw4GdvQYccrpg3U+7YU/MVPWItztyu/9AanUDsDyECyUE3pEoZlcYzL6mkLaQaf38hXTSp2X8BQONyza1nGsMTYjJF830SN4iov1D7bk9KeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765973567; c=relaxed/simple;
	bh=aGe86kWkfD3nvG8oBci9toKNq0ktbkQOHU4AB26yg7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WFby303ouWFENgEx3W7wwEhZ0ZXEUZqc2+KZyBjtEBWK+y3Rc+MPp627iQbtUw3F1GlSbSmF52ssYHyy1SZ6o+VU4bYUBxT81MdCEyFPxzRjqLvY9bdtfTrzW3WSYJU4w4paTX/wWfSIKR10mncwjP0fxeGDKk+tZDYzTR8NQ5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oTcWSqkb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RHmgNxJT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oTcWSqkb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RHmgNxJT"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCCNkn311858
	for <phone-devel@vger.kernel.org>; Wed, 17 Dec 2025 12:12:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S5xgaoTT69/pBHPgbjFkA4EHKqWZuC60C9uOsst3bQ8=; b=oTcWSqkbsxGmFqcV
	DKUxPRuWDotNrXy9NN6FyIIqTPEINRlgdnyMVT44Lym0NS6udIUyMLxX2o7ECUbX
	3fXFEXkPE/1XsfXGA/W0F9sMfVgzACEaXtqLYMpgtYnMPXuQu4F6jK6RzDRK22C7
	GH6tQ+zpdBdKmJ68+al2GmL2nUXHI7pY5kwGVhXLYFtMVeMKXRuNM/DF9EZdwrxW
	XHrKoLGJpQ77NTWLNhKK0ZBFwQ09lgVw31bWwSU+UnahwQMWzAM7b+ZfE6CgTZ8J
	dIUQixMoNwmkWqJmuTzAeMS4p6kI9b7ru4UMb0c9ecdF4E89pkajgDuVeF43gw/w
	YPaV2A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3t8e0cta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 17 Dec 2025 12:12:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee05927208so20197001cf.1
        for <phone-devel@vger.kernel.org>; Wed, 17 Dec 2025 04:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765973563; x=1766578363; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S5xgaoTT69/pBHPgbjFkA4EHKqWZuC60C9uOsst3bQ8=;
        b=RHmgNxJTarPRp59DQ+JI7cNReInQ3PJY80o32rUMHnFJJ3Tjhln6+RdBtLR34x3p9j
         x8uXg88KJqWpWq9wZcbRli/hzQS6k9aG1n77vndm8goznRv1hhkjt3tndgoUlETKRSLj
         syz6W1UwJulL/D+gmamAAdkWjnbnLrlXSe9mh0j0JaWswX8VuzBOp+UBARsqiDgS3CV7
         W2OnBZ5z2maGo0WThLLg0n/aq3kAI0DmiURs6t76NX9/EZckK4dQ0JB+ea45acpeDrr/
         ofe+GuJ5pQoURGziZ+sH6bKVYqyPwuMJtW/wxGaCoSSy3mMyKZB4No6rxoGrNIOTweX3
         KgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765973563; x=1766578363;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S5xgaoTT69/pBHPgbjFkA4EHKqWZuC60C9uOsst3bQ8=;
        b=Il8l3J9CtmYSRBydTTz/1WQzrMX60xkmHPQHB94tyBhHu1RGlKxIfyqlgLXfAQYU2k
         Unw5hg8gggjOlA13WN7piKh2P0OSZq7MbWEPhhwgged4MBhpLsYAQbdNgcXP+1hwH6VK
         u2kP33yCJO+QDbGRlUsnjVZX0MtGcfpZklPMPZy6US0UyfUVhAB1RIEUMKnQVItQiq9+
         EONv/eSmfzz4By52pSPDBVP7kkzq6wWTqVMEMjPgZBJJB2wdrJqj6HPVohkhujBlsQRX
         ATjBvFaWG3CL1jA7QneI1U2CRTe+Kb1eBKJj+V8Qa7COCYnghA61cgx0lQRVJqvfQkxi
         g8/A==
X-Forwarded-Encrypted: i=1; AJvYcCWu5ArTDe8c2Mz4Qag7B5dUDtAkHWk+XbNrX6J1tgX8n7YfHtjgkI1GVVcUML+IbNtNntaFhzymAna0GA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgaFnQKecMzmZHGos9vEnbgsscM/hAmZSFAR+ED/yEi1qvSYeN
	Uo/nAanS4VtxAMT05ghM18BH1H7XTplzG9eX01ZFFMZbY8oc+1eVfrwIfUvkN25XlSIRL08B7M1
	eSAucG9VRhF5jCwnSSy4xR50W8FqsbiGShlEM2cwLCAWs1scaJd6DBCXV+5m51PigxA==
X-Gm-Gg: AY/fxX5J1Sd2U8lfrSPIjLpcO0MZMQjLccgctjkKVpCopu1ut3z3eidjuDGO12CXqip
	gV2xz90LU6d8juATx5eCQ70cv51r5d36VxlJX5LqHDSnHU+WeTYZnoVd3ZBYbwu3uCKLLaJ+Csx
	fxtVImcT6SpiYnCvfiQts/XyQlkZYh3+Tks5ar/51LqeuWS7RzqbjsNp2OlAZdcume1f5qEL+7/
	AbCk/kO8GbRa3H+BUAIsLSmbRaquCCsBzbqxCKHofIYWumgIlujDiAYChrV+m41UICrOs38tKyn
	p4F0x/SQnfNQF3WTblPpZP6lj9jGGEwE6eqGDHpfj9yYZ8418Py9H8/4+nS0BRXioHXk1F4i2IR
	lN8OUz28kFK6dpHSot1qOQ2ihUQ8nHI0xKYb6swM/lMGkPYVmhHklEJmxI9wMGoyu2A==
X-Received: by 2002:ac8:584a:0:b0:4f1:b3c0:2ae7 with SMTP id d75a77b69052e-4f1d062fccbmr159588621cf.6.1765973563352;
        Wed, 17 Dec 2025 04:12:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5eVGC3ZWYSUKoHlLO+PfDj5QMt25oSCp8OK57mCn7+0Tam8KJf/1iWxw5fxtG/X/1ogAfiA==
X-Received: by 2002:ac8:584a:0:b0:4f1:b3c0:2ae7 with SMTP id d75a77b69052e-4f1d062fccbmr159588381cf.6.1765973562909;
        Wed, 17 Dec 2025 04:12:42 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa29f6cbsm1991353966b.5.2025.12.17.04.12.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 04:12:42 -0800 (PST)
Message-ID: <c786d33d-6c6c-4932-8593-857e7054dfda@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 13:12:38 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/9] arm64: dts: qcom: Add initial Milos dtsi
To: Luca Weiss <luca.weiss@fairphone.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org
References: <20251210-sm7635-fp6-initial-v4-0-b05fddd8b45c@fairphone.com>
 <20251210-sm7635-fp6-initial-v4-8-b05fddd8b45c@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251210-sm7635-fp6-initial-v4-8-b05fddd8b45c@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA5NSBTYWx0ZWRfX+svR1bfRxRAN
 q1W0z5cimrO50xmiyXxcaGFSsICmBRI2B6jx6xs8nWIV0zh0a7A1Yej6Vk7fdNn6XSTRe+Jik2P
 mk078GQN3W8PuEtqJqqwAnR4C+m0ASy+13BbIB1EWCYau4h1euCIxjASKoOnq5Zv+R0jjZu4iov
 vO1UL4HNilzcqSEVOOWBtz97UfPU5sXZ9iqjVh2U2fk2kBpiSItdczzckKxjNzaaNj4u4db43E5
 SrnhOheDG26R6lDJz/FjJW+WzWpi9L7RcRZZU8iGoiQSEj4GB5Git2UiKS5m74PCGRiQWDBmVvA
 iaGrETXSRaIbqjyti4AwZ5PcMrf36hWb7Twz4ov5nnjScBqRbT4/VGK+sOaFNgoc6zMwj0H2GfC
 5m9c7M0Bk1rtS8fWgBSczrZAoHKnvg==
X-Proofpoint-GUID: 0Z68d-uj1ID3a2D7b8qwTgVbQmgatqk6
X-Proofpoint-ORIG-GUID: 0Z68d-uj1ID3a2D7b8qwTgVbQmgatqk6
X-Authority-Analysis: v=2.4 cv=EsHfbCcA c=1 sm=1 tr=0 ts=69429e3c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=WSIVeowOIUgBBEAWWbIA:9 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170095

On 12/10/25 2:43 AM, Luca Weiss wrote:
> Add a devicetree description for the Milos SoC, which is for example
> Snapdragon 7s Gen 3 (SM7635).
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
