Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030A3345CA3
	for <phone-devel@vger.kernel.org>; Tue, 20 Jan 2026 10:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768904578; cv=none; b=YYCSl93UyUO+u5t2MecTbh5bTqkhpBSeJ8slHK8wcDEjHRe3U1EjjwJ/YOcsWqo93oV1+HraRdam6xPEjSNurzaZOQBqNv5Rl02/Gbl3n7ViOTjapBBBpOpjurZXnb0Py+AEmNKx47BuscYU91vSFzky8XkPtFfKNriGgxC7B4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768904578; c=relaxed/simple;
	bh=aRA/Y/85127uJtAj19FiziVj0c+2QUQd8LxtRzkIWZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M9jWQDrr1gRcpcUNqnTpCghB90OQJNzsfpiuY4IG7nSMDBuisANN1tJMYPGTclj2318/w2FoDflOQOM4YHRpwpOk8bYgnKniMz1h88KIp3H7wweA8y2CQSxAxHGQniqyTBGiiVTDDtiH20geHvBwnwOX+LkQbU5aShWfRvlHQhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gSrihVgA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d75m6zub; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gSrihVgA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d75m6zub"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K8nSJf3365637
	for <phone-devel@vger.kernel.org>; Tue, 20 Jan 2026 10:22:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E4OfKdMWQoai8cyNzsWRRAhlzih6X3/oI7QjxUg7ppE=; b=gSrihVgAx9SbcfI+
	qUREDDRw8knv0XzJltP3hPpThnLmWqz/bihTKUD1/K19COR+7aYDtMw9hPQDlqz6
	wET+uk3mPtDKkrNk8snenTfaxtZ87aSjXOAopV4UyBHn4qyyWA2jpYa0veimW8GL
	CX/l6BecYKQrnK3KhU1UNn5XCODAnNpiXcaqLFsbCkL5Bjjc4deCEfLr1psVgOg8
	aIo66eZZJXJd3X/MGrRISdeZwBjHg7iTfU440p5zpb30jrfVUD0/3evdF0TQmD18
	8EkSI11bTWLtvBN74GrXMsRp1mMiUYMysUwYqcBF4vEQ0xcfaJqWwEPGcgSSDm6/
	u6B4MA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsysb1g49-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 20 Jan 2026 10:22:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-501476535f8so17740191cf.3
        for <phone-devel@vger.kernel.org>; Tue, 20 Jan 2026 02:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768904575; x=1769509375; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E4OfKdMWQoai8cyNzsWRRAhlzih6X3/oI7QjxUg7ppE=;
        b=d75m6zub9kBlzyDp51biXhFLkVkQ4bu+kDf+pMXb+UhE3n0Cu4XeE0UE/ZM0c4zpRc
         f6lEgP0VPxuKPS4/KuNRJQyMcJeO846s8Q0brNV7m4KkHtENtjV5x44qYznpND8mIQjx
         ro3DEbgGtAzgo5B7NuGoNjDHg2Jr+wydsOlbsREriha0CDO769nPOS+ab1xbhfceukxl
         SRElgp+QqB58VgDzIY/wlXvuxf9u0Ih7u3YECQpbOPxaaSTdi4BTzO2Z5M+rF2NnVCA/
         xjODvvZJoby//6kcx1wYEAlfFDbDhad+cIU9TkhubTiIU/XoKu3bfOaS1hZVmVA9/FX8
         Wspw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768904575; x=1769509375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E4OfKdMWQoai8cyNzsWRRAhlzih6X3/oI7QjxUg7ppE=;
        b=FQxScXYJYRlLjNR2KyY5YE6bdOtAOmEOtX2oM9oNRqPdXZSdSVuZUuTdpj1F33nZOC
         AUCX1SnkxcfDt+lBrWFIa7svfu/paPy78N6y93sS9uCCX+5JDVO+SslPqovcyY8MU1iK
         MmxUXuMkJYpSTZ9xRrictELfv0j1mVKZq6IRAb8q3ikzBYASLeuiDIqgd8BmKtT/bsyl
         IfuvKLl8oKXTVKS+hHlbT0sIsTTPOWsceQtgPcfQlm/HGmA68f0OuK2pYTIABqd4NHR5
         Bq8p7tYVpief89KXxdx9TxBjJJcHF2tYcg/uFbWl+RLNWX8h0yfaFce1ov9YbGeCRCUq
         9JFw==
X-Forwarded-Encrypted: i=1; AJvYcCVUrFnAb3w5PFjnKlVnITx9rZgbxk0nW7XZrNvsjSNQwBr4ouxK8sMnxkd76MQynYQWpK5f9pFBQmXiIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyR/KRGV6VE8QsALYNuzzMpoNQa8Jbdc1OyrhmKvkxrIsJ9HLN
	TVTF4cJ0zCd/gSlCSqAE/UuZIbyIxtDWqT3Fnpkox7ocE3VPg8cDBrB8bq9K17RXcZtLnfRkYxQ
	MLcTgh0bbmtR/isZufqp6lU6MB/RQx6SQ1JMWQ6SGjDE0khVz6pvHPn4YVeMjT17tcg==
X-Gm-Gg: AY/fxX7b64DfZUh3VMSt8C2Lr1CDKN+kRJfzUn8Md1WHMWPoXls0t/M4gLayhOgM4eQ
	LCDQ9fP/NIfVJ3tSk4oJNOmeWmd//KXHtn12zCji7ox4n4EJ8/BEMNcTnoNpNzPjDikTZ6GI9Qi
	LG9DlE2o0qAJSJvrtfqBB/pEE4Ql2jdhccPFjzWcFsENhdC1/QUuwerKCFqFymIvRULGdlHTCC0
	7yQWn55guUAQyeuLGRUko6wLEOER4RuQCeWnbsZUKb7QFG97LiJHDs1nYSE9EmZ4MJrAM4BMuLw
	tee88a//tlwtX7yJ7OWYRAPBulK1ELYoP6kRX315/eLrtp5EvhlRSE1BC8Q/YcxiRFBnsGFJYxm
	Xu5PHqajGtUD2kWSYgqEr/wKkN3Mh/uxIx+iN5CN28+TPayksgxsCLoms1vwGfAv7Sac=
X-Received: by 2002:a05:622a:51:b0:4f1:b3c1:20f8 with SMTP id d75a77b69052e-502a168dce3mr166361401cf.4.1768904575115;
        Tue, 20 Jan 2026 02:22:55 -0800 (PST)
X-Received: by 2002:a05:622a:51:b0:4f1:b3c1:20f8 with SMTP id d75a77b69052e-502a168dce3mr166361151cf.4.1768904574630;
        Tue, 20 Jan 2026 02:22:54 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654534c8791sm12664677a12.24.2026.01.20.02.22.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 02:22:54 -0800 (PST)
Message-ID: <865f145b-2170-48c3-a412-a4f22fbcba8e@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 11:22:51 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm845-sony-xperia-tama: Add
 bluetooth
To: petr.hodina@protonmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260119-akatsuki-uart-v1-0-238f4da4fa56@protonmail.com>
 <20260119-akatsuki-uart-v1-2-238f4da4fa56@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260119-akatsuki-uart-v1-2-238f4da4fa56@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xvFcsOQDWs-6LMo6uc6Ppr6UbiKznDvV
X-Authority-Analysis: v=2.4 cv=XJ89iAhE c=1 sm=1 tr=0 ts=696f5780 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=sfOm8-O8AAAA:8 a=ne8vudJ6NvtqW7c4UygA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: xvFcsOQDWs-6LMo6uc6Ppr6UbiKznDvV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA4NiBTYWx0ZWRfX55NDvYAb9oAH
 gi0nO9Q3QAxf1fY8KjlFS4+fhnCYOZZ0440G7r6V7iCdfcD0eZOQ044c2i9lsjwy53jbaw95U57
 V3aR0v7k/i3RMYbngOHLsn8VgG38diHXbYtK2UyxDtYpX2JDFjiz+sFonaPIaI/4g0YSMNsS8fe
 i+w+ecZVbv6cm8BxYzjAASIvAxLoT5yC3hw6QTmh727zyFqqTa3pwjLmJ9cGEml2KXOuJAVQiW9
 6kOTWUbZMzR23dXn7n4rvSrqADHH0nXP5fQncN5a9ZXmRRsU2+rIvChhldZ3P27BWjEWjgBHsVg
 R9pPzu20itQZWRHbrVeLKZJpzIjc6mShUWT1M/L1uf4gTh/tSJMyt1T3dFf3X8jg484qMiAzYtZ
 lF4F2Va299q18MKnjLBLzZV7HuxlmzQzMULqMaEUqdHJMuYqtcKxpuXT8Sqiff/WnkdDbletQeS
 hjMWJS0UVQA/+iNskXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 bulkscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200086

On 1/19/26 12:58 PM, Petr Hodina via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Enable the bluetooth interface on the uart6
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> index 68841e036c20..f23f9757a08b 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> @@ -755,6 +755,23 @@ int-pins {
>  
>  &uart6 {
>  	status = "okay";
> +
> +	bluetooth {
> +		compatible = "qcom,wcn3990-bt";
> +
> +		/*
> +		 * This path is relative to the qca/
> +		 * subdir under lib/firmware.
> +		 */
> +		firmware-name = "akatsuki/crnv21.bin";

'akatsuki' is the codename of the Xperia XZ3 specifically, whereas
you declare this in the common file.

If they all should/can use the same binary, let's rename the path and
if they have to be separate, let's declare that

You can probably grab the firmware images for all three (four actually
but I don't know if anyone has the XZ2P) devices, dump it from the
bluetooth/vendor/firmware partition (can't recall where specifically)
and diff the files

Konrad
