Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AC837BE93
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 10:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774349440; cv=none; b=JvT1y7JE5AkX/MswF/7O2IkeQF5mHAed9CgnZUXq7yTU6TteYBLj3sD2G3Yk1OLfxw6lWJvzphZoBAfV2kf9vVrmV93U0sO+lFsno6UCjTsaY+jv94iwlCeMNDo8Did6upObXlVqLT8MBFVm/kxVy5V9wgt3UiJvmBfP2R1IZA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774349440; c=relaxed/simple;
	bh=W4mqx4IGbi0XyuNEpZsq84MGmhg7ANoyky+79AVy+Bc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K6NJADFsUxbSeOGBFr4/hg6ECkkg4Yoi/81P28uXE5b693V8ioU3g0BukXR+4ISL5fPwxbnK0xNAEc4uytBjpygu+t+6TiHpgOgtsT0W7Om51QWvFPm7PahVaJKCUvC/TPrZethjxmsDu2aBC0LuSw8wy0l7aI9hctBoF1pD8EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PA1cUVR3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hnARYDoA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PA1cUVR3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hnARYDoA"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9vHrV890840
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 10:50:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mNjge6Nz49ll7u6MKOydj9vys950Bf2Wr0Hdbte7e70=; b=PA1cUVR3E3ay/DbG
	iK41uVo13xhYXuh0Jg7EtKluwaaXeacen3uiEMCedFfBLoCxqPXe3xlWBRVUlMZk
	ReOPgbOsWVaa1fFMA5T+bUUhoAK2UzsPn0E4WSrWWrpZ0WjyPXY/kaCJxKGeCc2K
	nT80MIlSlpTEnvGhIRSIuba1e1EfPtT/lwCAqXo3S+RNgafg9JWPLwfwOfWyzU4X
	8dMXMrKZrOfr+qt/yllwd2tzYiUemr2A3exoHTsNVNvoobWGYQWFx3o/Q7Iy2ivT
	yM9Exq6GdUgHOVMj0U1yoWD10W69akgTIyCyEKovaJj7gtOFnzHfRf4SbQZeQ8Q0
	6f2KEg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3k1x9f23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 10:50:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50943e69b08so41604941cf.2
        for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 03:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774349437; x=1774954237; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mNjge6Nz49ll7u6MKOydj9vys950Bf2Wr0Hdbte7e70=;
        b=hnARYDoA9S6uF8J/Py3XlVK/lt3vVJaAuadpiE/amZ2NfBVWL3vZUs71hpFOCwGn2T
         abX1GyA9+ajHAnUA7z9o7f80237zaXZR8qPHkPyCfRe5KtnI8BDALI+/FMnzyzoajolW
         5hKHxkq0UFKbcFvEA3cYn2rvMa5h0rSP7xioYECTV2WCTVbxqGGuYUIsWadC9ZBBJJhr
         Y9DdNvFxy+vjkQ3RJTMNMFn0d9xljaA/XPg+4cSqVz7yLkYDu9nEFBbiKWgfg+hH5Vvo
         8QJACqWUd4B7E0tWcfMFgep3c4agOq/I5/AiEoiqDwBCcskWTCiUfc95r9hWy7Wso6XD
         A3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774349437; x=1774954237;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mNjge6Nz49ll7u6MKOydj9vys950Bf2Wr0Hdbte7e70=;
        b=Vi6kkGUVArsF7BaLKn65QG2tUNUnSsZjtEj5Ba63Td2yLM0sGq5/iOravXGk6FYJ13
         Vkw1F9B6w/kBCj+nJIZJJnS3+Eo6uqAf9yTUYaPZag4128OZdGyYr406UfC5bMoBUik4
         /f4n/PCv8N+gL3CLWC3dJUzHlfKLMYS5vpaBR4ovpP0H85yCqLb6Gsnlv+aXsAS+Njlw
         B2zYd+E48rMHYTeH8ISGyeVCGO5mxC4n/1x3zi2IAKZG0hEVqLBAjOrE1Qmqnr5vEXr3
         zQUA8T6DKTNgSE1uGGWG8pA8NrCg1Vtiss74ely/dDmB2vK/1ZA8RWBM3LWEGfdxb1J3
         lEXg==
X-Forwarded-Encrypted: i=1; AJvYcCVBeB8caUunv6U7e839EEnnd59VWclzBbgDey/UsL1VMalu8hIyS2RhP52Z/+YuMGXIg1KNhDOVSkYeSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKOXa45jj4H3VeX15Kg2BZe8xXWlvLmdOBNvziuTqjMepsnJ1E
	/i3zByypkNThrjMFh6NgJ2kiLKSomXSpeqqAhJcW8ve8ONvml74ueYOt+K80RtuQNo++Dn+MpHT
	8/ELPjdmdG4sdhRjNrQDJPrecYyrIkeXH8E3klmtFjuy8vbgCuJsAnxGj1rb+5iNnLA==
X-Gm-Gg: ATEYQzz2tB+W/ZibGUX5Zb2/gviT8LKBkIU0qe/8gzd1YYhju+5+C4l/8C7pL6SsC4Q
	HItMht8JpovKFNlGzlYZ702uWEr3LoBMycnnnYTHnEJ2f20w9fWY6N/uuu+CPBo9m+Tfs8eGXj4
	w+1gm1AdUN+Kya4RUqEgjDfodlnhw6V+SnttvGaCkiT3aR4hGHq4dvtfoLrPmwyUx9ckkWrLuyq
	ilYrBHDncomh2voU9Y7q36/1hudrqWjqyhpgLQAsRoil4DQBvd3gqWGSI6VPju/Bfv/LxQUjGTL
	vUjHYbB7p8J5NseFmVXDMdyBTduEel/Y8DDhoCvRpDXNUomfESZrJ/oKTzK6OwEGTbvRhSx0UbC
	ow2Q9yCEBdN8XMPESsKAQQQJ9urVce/LJSqkUzdPu17oPEGhrDYfuIlFbzpDJ6AwqGobe21yVZU
	jPGhQ=
X-Received: by 2002:a05:622a:293:b0:509:2b5a:808 with SMTP id d75a77b69052e-50b373d3484mr182866991cf.2.1774349437389;
        Tue, 24 Mar 2026 03:50:37 -0700 (PDT)
X-Received: by 2002:a05:622a:293:b0:509:2b5a:808 with SMTP id d75a77b69052e-50b373d3484mr182866731cf.2.1774349436919;
        Tue, 24 Mar 2026 03:50:36 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668d2677970sm4562953a12.27.2026.03.24.03.50.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 03:50:36 -0700 (PDT)
Message-ID: <ed869f72-8ff2-4901-8b1f-273f2a635bdf@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 11:50:33 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/15] arm64: dts: qcom: sdm845-lg-common: Add uarts
 and Bluetooth
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
        Christopher Brown <crispybrown@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
 <20260323-judyln-dts-v6-4-29d70ca1651c@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-judyln-dts-v6-4-29d70ca1651c@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA4NiBTYWx0ZWRfX+h2bb0/Wjr2s
 a3mLbZlcY16I1QUuwB2cNv55mXS71EggvV6XBJBTNLmk9u8Y5BSyZz5sF4eKnC0pRxp/vsgdsLa
 1aQQW8CMw40SAiLfPohPGvz1Lxf0LnfNy+EkENbVDMeM4bsIAnI5G0FfXsGZlxfUzFOgJ5VJKUo
 Wiy7GzP2P6uv/Gn8DEpql+Idc/vnjvdg4X9PHeblGGoU1rfSC8paYLDosWd7CTaaZEXEiv/SuRb
 fFuq4h59IZxLuX34sI51pw86D2M/QTQTKAYwOvu2Uq0En0Yx5EF4pbnM+yYIiAZOB/AFbISBL+n
 FDVtlQxjn53MFIlJxZph4AmYaP68uZXFdYnAqXSb+ISVUQFOKRP1tCnvqHyzryIgtRLGe6Obmqb
 zQIeQ1myZgJi8ELQ9RriE238SV6e6IpqsV/MKM/yUr1AJ7pf5BofwS5123jXXU5VQk8vIcOUt73
 21SbpUVz7FD8N5d4LOg==
X-Proofpoint-ORIG-GUID: FHtOQ9zieRk9VvoPpzYvKylWESipKilq
X-Authority-Analysis: v=2.4 cv=O880fR9W c=1 sm=1 tr=0 ts=69c26c7d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Mq719mGqAAAA:8 a=EUspDBNiAAAA:8 a=Gbw9aFdXAAAA:8 a=rV8w3nCtgW5a9bFugD0A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=gOTWM5O2Sh7P_NUuVqe5:22
 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: FHtOQ9zieRk9VvoPpzYvKylWESipKilq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240086

On 3/24/26 3:06 AM, Paul Sajna wrote:
> uart9 is debug serial on USB SBU1/2
> 
> UART RX is SBU1 and UART TX is SBU2 of the USB-C port).
> 1.8V Logic Level
> Tested using pololu usb07a https://www.pololu.com/product/2585
> and CH340 USB-UART
> 
> uart6 is bluetooth
> 
> Bluetooth: hci0: setting up wcn399x
> Bluetooth: hci0: QCA Product ID   :0x0000000a
> Bluetooth: hci0: QCA SOC Version  :0x40010214
> Bluetooth: hci0: QCA ROM Version  :0x00000201
> Bluetooth: hci0: QCA Patch Version:0x00000001
> Bluetooth: hci0: QCA controller version 0x02140201
> Bluetooth: hci0: QCA Downloading qca/crbtfw21.tlv
> Bluetooth: hci0: QCA Downloading qca/judyln/crnv21.bin
> Bluetooth: hci0: QCA setup on UART is completed
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---

[...]

> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> index 09bfcef42402..e530a08f5e27 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> @@ -43,6 +43,14 @@ &adsp_pas {
>  	firmware-name = "qcom/sdm845/judyln/adsp.mbn";
>  };
>  
> +&bluetooth {
> +	/*
> +	 * This path is relative to the qca/
> +	 * subdir under lib/firmware.
> +	 */
> +	firmware-name = "judyln/crnv21.bin";

What about the other board?

Konrad
