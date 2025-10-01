Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D2A279782
	for <phone-devel@vger.kernel.org>; Wed,  1 Oct 2025 08:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759307385; cv=none; b=jm38sxSfI+4lv2rU3OMNnGqqAQIvn1wKXLxPEs1of+OSh0URTfhgReKDWEq5mZvuvuuAUoh7UIMMzkBeJuFBX006tjKUEA+UPY58eRNXoa+mWsTt9yMUhJD/FsAJQQ5hg91gcxjEe0mGpHb55H6T/Bts+MKQSVqkb0X1bAqKENc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759307385; c=relaxed/simple;
	bh=iqZxrMmOCUso30RFZ6gTRXsEmOGLnP6HtbNYPwF1Wfk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HckTOO5alCpvU9H/4D/cRXlJQnw1EEcFFTV/fPU2TnC7KJLd73I0tV3FFDu35vDVSYSnp6KTYESJVQoTEcBUjAw1Hom0mu18sM/FnoEJQ7mIr4+v5t9w2f8K6iW2MjKewdUnHUJQNVXN4MwWthgK89xw6Lh6pD0VkG98jI/TLJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lPY2n258; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lPY2n258"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UL37cB019070
	for <phone-devel@vger.kernel.org>; Wed, 1 Oct 2025 08:29:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A4bz1NnqQrT8sw5X8qWBPC30nWyB7EeMqsmSDdrK1ss=; b=lPY2n258l+FI9ZYs
	tQEPtA1Y7rKFvvhrDRtfR3xIn8CddVUsdPczxKYspN6l3bvWOFF0781+Gz6PW01C
	RRhoYGkpp+1p0aX82pS0nEh/4hBRYgGrhYLp8PBMh05/uAmf9PY9IHEkuiYkWmlg
	42IfkoT5d1lvWF+YGW3Q3ivi3MPORBtxePZ0AzB2j/cxJLt89/0XOuYjZ0yILENh
	RGHtVKvvi87G8CXUentc5KTtbmpIGiEGr5KrDe+V6u4S7qcADzKeS0st5tMQedqd
	xPz8ZIE72QYHnuPsB15cmqz4vd07TeUT/LTedkWXmu67dQmkxqlzC72RTgLdxLen
	oV+TNg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80tv21v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 01 Oct 2025 08:29:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ddf2a2d95fso10317121cf.3
        for <phone-devel@vger.kernel.org>; Wed, 01 Oct 2025 01:29:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759307382; x=1759912182;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A4bz1NnqQrT8sw5X8qWBPC30nWyB7EeMqsmSDdrK1ss=;
        b=LtkCcuDfcWLD6888rY5GxnaoUcI4KhBk3Jm8fjydl5TpUDrgP/hjTXWF6A5Kfk9U4E
         xba5SCxXVqC1wKeA2ONBkZq2tWX2FugA2rlnhll2+lweOJGNO1L5AoEWFAvA4krxghqI
         gV2nGLsjMoor/yWwiJAj4drxu6TXqOl1DLX8Sie3t9Tj6CbCsRiTsaH1A/YXmkTtohj4
         oIpGfNYaf2vMfBqoOrsqNN37WKD/Z3TxyZNBzsAyRPUsas9PPkSAN3AriLfny2Yr7rxe
         n0UL6KwDooEJoFybYZ3XmRLRyFQ2x6EkQm9QX+bUfqtT1C36dv+lKC/FjDjoH7AzvJ9k
         2jXA==
X-Forwarded-Encrypted: i=1; AJvYcCWf/mizc/5vHwu3eAthKeDfy1P4xy9TApH0eaC6fKq3RJtQ9AcW9466xp+/OWa4yPS1oqNZGCsq+mjIkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXJ+osbcBspsYX4RR2TsXtIu0CLDENFK4QN8Q8tvxFSnEW6cT9
	BO6nLBPid9uxwlUuuqWeEE8dpG9Sz/+YxG+FOs5FD2qmGLGVYn2H4ZgKOFfyFHaIZelJmS/u/2t
	nnhoBwZSq0ywdpAKnD2oIZSYl9YwuLyA+hCtHezm5mpOQ2/Hji34+YQbVfyVn21G6QQ==
X-Gm-Gg: ASbGncsNubmBBiXQ3AzAth09eHLL1RtuI+RCSJB0cJuOLki2fpxff22Za2xfOzGDdu1
	TAZRCIbk+PGW7gMM8o30kKlzBUrJ2BLGVYBybynupmpB66nUK8/+7UB8F6LLL6xUZwfyhNntrsj
	z579arqjMzmibF/wBIrOIdLS08nMIC6HGLWfiMi8ludJaLFkKdYaPUaYnlbUD+wZJkm3+f0mVKS
	BHX9dHYA648r5lXxBKmMEsEaX8Ns2TIUmOFEkIx4Aj7v6Le6InohEnZfo3tr/zu4tw1ZSdX0dHK
	g45LwkoKJI2DDRCvVC0apZQwJ0Sm5FLtv57OFCnh56ADY0eDNrsSgcb5dfGDYnPRukCTcdTxCfn
	t5AgAGqxsQUEj3tuKrBjgw77ez3c=
X-Received: by 2002:a05:622a:1444:b0:4d9:5ce:3744 with SMTP id d75a77b69052e-4e41db86a41mr22416141cf.9.1759307381764;
        Wed, 01 Oct 2025 01:29:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSUqL1RsW5QiQi/riKCanq1p3YM18OkyHpHFi5otusy0fPMrF9AasNPUvKABfOrGjygx+Caw==
X-Received: by 2002:a05:622a:1444:b0:4d9:5ce:3744 with SMTP id d75a77b69052e-4e41db86a41mr22416031cf.9.1759307381329;
        Wed, 01 Oct 2025 01:29:41 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353f87511dsm1323076766b.43.2025.10.01.01.29.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 01:29:39 -0700 (PDT)
Message-ID: <dfd4a03b-22ee-4ea0-af4c-9184a464cad5@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 10:29:37 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: qcm6490-shift-otter: Enable venus
 node
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Alexander Martinz <amartinz@shiftphones.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250930-otter-further-bringup-v1-0-7fe66f653900@fairphone.com>
 <20250930-otter-further-bringup-v1-6-7fe66f653900@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250930-otter-further-bringup-v1-6-7fe66f653900@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfX5rlvtLZBgImi
 4rBxa/LKN/0BBeKUldZYhJxLBPBVyZv2eV1mS9Jzz2IeKjvf/qpsLwJzFcA7sVCfmijtBvbGbnl
 LhAB/O/LfdpA/XdZ0cPqS+gqg9qCaqJpNjny+UazVHATiZtHbIPXpEQcQanhxBqDTLc/bhlvinX
 RTllnjKfDXAz26+2Ph9PTL1aH0+DOL7De9I/Nb2bVU66syfIkNOF9p0gFjKLCCYcOzlNeHufMpv
 JVyl0cUoYJHFP8V8Q/bf28xPOxYt8cOuz/z2zvuib6Jm6dVyaVdcQTXyH02XesHzfVzMuCLVzSE
 y8WkrxO2nnsk0Q+WBE76BQV6ySSP0OavzlYzHTw9lGgimt/5f9qZlew1Kp4wKih6r9f96lqwyGp
 XzcgtGgeigJfjeikiIfnWzL9N6uUDQ==
X-Proofpoint-GUID: 6m8cQQD_TODVe-W0aKymP_kr9f3neyyE
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68dce676 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=7Ovdx5uLAAAA:8 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=Q9X1YL7jsAXwpJAzmCoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TQZWkJv5rNK5-PaLMsrg:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: 6m8cQQD_TODVe-W0aKymP_kr9f3neyyE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029

On 9/30/25 4:32 PM, Luca Weiss wrote:
> From: Alexander Martinz <amartinz@shiftphones.com>
> 
> Enable the venus node so that the video encoder/decoder will start
> working.
> 
> Signed-off-by: Alexander Martinz <amartinz@shiftphones.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
> index b4c69dc50ed0f0b3cb45341a01c89210bd261993..98c1ad4c21118831f079c83f4fe66ea30c141fac 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
> @@ -995,6 +995,12 @@ &usb_dp_qmpphy_out {
>  	remote-endpoint = <&pmic_glink_ss_in>;
>  };
>  
> +&venus {
> +	firmware-name = "qcom/qcm6490/SHIFT/otter/venus.mbn";
> +
> +	status = "okay";
> +};

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
