Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A741A3E314D
	for <phone-devel@vger.kernel.org>; Thu, 16 Apr 2026 15:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776352657; cv=none; b=AgrjANRiYHn748bkcBExKTxm5XSl9imcA/8O4IygOUFnUW/dQn/6s742UiVvVEEWXlhm+T6Vc6+tnrLlusIYLljIwXX3Z9ZRKURx7Rz0kpqhT7fhjjhA42vb3Ax1Au7SRaGhSAtp9j4eGeApk2vhS33zBNEzH9Xy67d9PY6QWIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776352657; c=relaxed/simple;
	bh=Y9LX7R9+xvJZFxNo9WMoAQ1JYWTg+bkpYQnvouL0PCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oXCK6YgPcwG4c+qfpmcPVTem+KPDX77Uzk36RNa6aDIrvmkO1p4nUp7X/XJ/D9Bx1QfaW6Kd1wm5pqPJSdpzwyWxY7DPRpfhncU10PZsyQNQHzc/y37r3QIyKHTevDJK3X2/7BrGuHe4CiX+TKRF65PSz2ja0mKtjh2z2wGz4+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GwXJkIBn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I2hmzzmb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GwXJkIBn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I2hmzzmb"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63GAY4Jp1245288
	for <phone-devel@vger.kernel.org>; Thu, 16 Apr 2026 15:17:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aZFe5oFc6le2GeaVbR8SGtLA0c7Ib48E+jy/yvzvnMU=; b=GwXJkIBnO8vEVG58
	EgVKlZQPL3fZjXcXGGeqWrdyqQHf2PSvtNTeBzBHcI6xJEpXstE6TNM1WZM3+xfp
	wL+98aKkeHZEmFrFtrdE37/VXOwdt2v6HHdGW4e21JkYYhGIOzPmjf//pNP7zihi
	11BuPlNvvaVOFRr8Vb6V63Xyzrur8/5Cl4OM32WChWxXxraoeg3w8+jmENmQach6
	zJy4IhqWBQWLYkrxPEXb4LKnsMZa4jhJb53upzSfB1QiUvLl1DfN6qY/GWsfIa+Q
	p0QOURpAj5f9mbKHB/gOhwuIkOroh6tfM+trwOj1tlONyZQjCJZY3RcIFvQ46yR8
	Uhi+lA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djx4k8xny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 16 Apr 2026 15:17:34 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-605a1faa7f3so571579137.2
        for <phone-devel@vger.kernel.org>; Thu, 16 Apr 2026 08:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776352654; x=1776957454; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aZFe5oFc6le2GeaVbR8SGtLA0c7Ib48E+jy/yvzvnMU=;
        b=I2hmzzmb0c5tUeklxalLFQJgkHKlP5H+NLomFBqSww0HYwHLUWtHnW7u8/Z/8OrFw0
         TBsNqRwAeBR/z8HXUhdnKJbD4HpNPNWO3chp+vhDGmOgf47ns4ceBbEiEuVaEg1DCsQk
         Cck4edpeHexXYWOvGuq9AAM86SyCW13ry7Xoz9X48VNFj0qefZhYCT0GIe97kZJx2QrA
         i+LOmIgVQ+NiUudnipJvqp24iNxPiD8yixO591tVChDf3i2dpJHOE4IbbYtRk6Pc4fSc
         lfBYI/kwyYxR8oXVU+DIqN3Mk9JFPhsh64fw4iJrjjji7TKOoRICbMmVi5EqTDQNKgW4
         VQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776352654; x=1776957454;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aZFe5oFc6le2GeaVbR8SGtLA0c7Ib48E+jy/yvzvnMU=;
        b=lnEOx/0pJe/hlzD0GQWSMWdMTAM9kiqKycr4HyEVmqMeVttJvMLUBWaGN714/td0zC
         HLhhg3ek3jMmmSNmr4YECemDDVfgY2ICmOcZmXXK0+EJ39wSjclSgPcr+PcYxiGndfnn
         u3p4/ztrSkGKcgGuAsMX+rBjiL4Dw4faZZ4JtuFSzJVOp5Aco7YK+rZlnXc9XhV4uYAv
         Kn7dVavf47M3WCu6wbJPXc/4x0ZmtG1wrZiX9KvW9ZtOwFelgjYxUK+G1Iql+ZTF1pSn
         UdKPlT4xCoXcaBz1FtZ6gefSA86yMCoezl6MIBIDVFIHh8nzN1f/JisG80miJBoMKhH/
         TMWw==
X-Forwarded-Encrypted: i=1; AFNElJ938PQGYMWD5o0ABmO8CnQeiZVtfDnp3Jf6546HKNc6o9oRsZ3N0O9sIujhi/hTIxytPNL0jNCYb75+Eg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXc+ePDd1ZptCKfQFF+HqoUtz2yl8XrDRJcgJFhKXI0um7jtqc
	TwkVOShx0SfcV30Ch2zGr6xV219gs+e36lJRuQC9I6SwFK0oLMT5cDKBAxpmJXMCk3PZnPGojfE
	3Bg1jYRAqq8xK89Y97NrrfwcgBJhPehTny1quA0H7PODFtsxs4YBJY4DJeU4yTyNVQA==
X-Gm-Gg: AeBDieuFJzvwAXxkHvFmDZ8AZe802suB/9Jux+y8fBKcB8AgmYERDhP3nAJO82QdkLu
	vut/Zrx4W2NMKkiFY47z3edf3AOWNEIlmm5BjT5+1/a6cZBFsja1GmKgid585lj9yaBu0UcEca0
	q/6+S6WDjLqeQgltMUUiL09/pv4kdCDNz+UBY5tXwX7pamNYA9NaDSOs/EyoGMfiMbg9TknhRLA
	y3oOOWRTztbzkL0fsU8U1hoQWtPGhu9SbJTu+81BekP1Q9bs9teP24xd7eulWFM+Uy7JeukylXS
	PycDPlLsPW/ma2wm8dyi4kLeiPQzhofXvPLwyXi4mP0jsyd4ksDUac1unwDcrx+pZEXwexOE4dV
	1PA5qZ16ZURUt8t6R3UsMUcMjegtv7uVxg+OQSo8QbTazvyJmm/z2uHDjFrCH5wya7FWAHR14gZ
	oJ8ikuY3kN6WsJPg==
X-Received: by 2002:a05:6102:5c3:b0:604:e96f:af36 with SMTP id ada2fe7eead31-612b24cc542mr1280257137.0.1776352653985;
        Thu, 16 Apr 2026 08:17:33 -0700 (PDT)
X-Received: by 2002:a05:6102:5c3:b0:604:e96f:af36 with SMTP id ada2fe7eead31-612b24cc542mr1280216137.0.1776352653539;
        Thu, 16 Apr 2026 08:17:33 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba1778c3ecasm181609466b.44.2026.04.16.08.17.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 08:17:32 -0700 (PDT)
Message-ID: <379806e6-f855-4960-922f-26e3380b4afa@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 17:17:29 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 05/10] arm64: dts: qcom: msm8939-longcheer-l9100:
 Enable venus node
To: Erikas Bitovtas <xerikasxx@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
 <20260416-msm8939-venus-rfc-v1-5-a09fcf2c23df@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260416-msm8939-venus-rfc-v1-5-a09fcf2c23df@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: afXxGjVO0e0_HDG3yecWZpamQz-zGfLj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDE0NCBTYWx0ZWRfXwoaYVKDkd/3X
 p85igWwwFVQ9dBUwpV+cBmUGhfdpp1Fyr+BVAzVPasKVlqfvYCu6V0mqeM71sZUhICeq0Kqctiu
 h7liB4c/c4KeHnquifcJUV7XpHD/fU+tHh9mZYgO3IOyeXAqni2TRPbj67avqXL5sMy8cDczx/e
 1LnnXtWyGbflM6nabtTqjafqSFUurThg0JxIG9MbKIu356X6CyLi4elT5lsZOI5SZoWV22WUQ8T
 /kUBzo0xBnxBggBRcsA0PDFLAfag8dVtC3/US6iM7dY6Uzr4E13CsQxhXhm7OLaY09NIMqF+Ks8
 XEmFLZ+oKBldiDo0CbdyVv7ZccYe4mKy+qSY/U0/pCZ+BN8addxny6bcfNAWjYdGBSroyYnVdRt
 yjR2k+0IsATGMn/qcu9Sv1RYJ12QO2YmbkgQnT/RO0sEwuhwREtoGGmhxDztiQySxRkOA3JlMq4
 FOzA0FmDyZHQf6MUzHA==
X-Authority-Analysis: v=2.4 cv=H47rBeYi c=1 sm=1 tr=0 ts=69e0fd8e cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=HDjIzE35AAAA:8 a=PzOwlJsuetSFvmXlP_AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=y3C0EFpLlIT0voqNzzLR:22
X-Proofpoint-ORIG-GUID: afXxGjVO0e0_HDG3yecWZpamQz-zGfLj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160144

On 4/16/26 3:43 PM, Erikas Bitovtas wrote:
> From: André Apitzsch <git@apitzsch.eu>
> 
> Enable the venus node so that the video encoder/decoder will start
> working.
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---
>  arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
> index 13422a19c26a..48514c3df718 100644
> --- a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
> @@ -314,6 +314,14 @@ &usb_hs_phy {
>  	extcon = <&usb_id>;
>  };
>  
> +&venus {
> +	status = "okay";

Likewise

Konrad
