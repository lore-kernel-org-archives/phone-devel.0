Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5621E156CA
	for <phone-devel@vger.kernel.org>; Fri,  1 Aug 2025 14:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754057025; cv=none; b=A+gC8/LH9WkKrKrWcw6h1yV87Zi1JNAs1j2CmTMfGjwcUFHBufopzd5ZhkOhQf5gUvCZNDmAJyv3ELM/DD7ta8RY/Wjovo4Z0tWe1FRKahIOQCVfZpNyC5PBiAEgVqGpg4+DgVWaDNlsAZ3Bz0dfORXe45bvRYG5RUfetilzGYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754057025; c=relaxed/simple;
	bh=H0ySXzvDbuoWs7r8TGqzxLl3oxORf/aA9p6f3Jf4ccU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mp5owVsShjsjEFSglzLDu6TxO5n6vUi6eFnd3oXhi1VTuRzTWIGdLbiLqiRMljpI+5mKH5x4E0bai9xqq/RJ4Eg1BWN+d8QGVBbyllU61aXJC/zyMzWWfSqAs8lsh5dDiP8MeQfekHynUMfOHlqYlR+x7LDChtBPIBSDBy7VHPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oUHuZ0Rz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oUHuZ0Rz"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5719Dsim006861
	for <phone-devel@vger.kernel.org>; Fri, 1 Aug 2025 14:03:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ku4N4bPFyWj4gyqNPk2SoqswYtjh+OxCezwK2kazDYI=; b=oUHuZ0Rz4u//HTxw
	r4wqWkXnzLwbX7kbEO6hUaGP3GUbbfWS/MKTVZV9puSfAKQjR8fySBYonmFkXrMa
	6RSNw3vERBBYFVlQG2+AMHUWo+ZrWkw69sCJOzbheaOrGyXliINiIK4Drm5pU7AA
	tJf2klSUKTcS0Crs3dacU6XtuJZGX0tJroP6YlJzzQdNLKFADC2cnfd9HjnWGKme
	hhzfKpmHULqbE755maFP0gTHbPwH6DV1ZDwjvclDdz6JaCDK+o99qo8wbRs6HqqA
	wDhDuhydRg7dywZ4GEKhG27z2WBFrZfWZ5cru8VIJmCONueEQ7xgG76NZXnaalzR
	DRT5Dg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pm2uwmd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 01 Aug 2025 14:03:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ab77393308so5921071cf.0
        for <phone-devel@vger.kernel.org>; Fri, 01 Aug 2025 07:03:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754057022; x=1754661822;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ku4N4bPFyWj4gyqNPk2SoqswYtjh+OxCezwK2kazDYI=;
        b=bUfvYz4NJ/nkDgSFhj1hgwWlK31IWQFMGY8Qeb6/qLqdHo8JIWoFj9OOTTtwjV8qV0
         PvYsba346L1kRJ5a8+GmZOWofUyL8aRii0Lsj9sEqwNOzdrx8ZEPauk4u21nDSkzQtlW
         fjR8bUJIP5HbpTvCkJ38ghKYB4lrzHNo1kmqkUNT1JnD7eI7vI3kR+oCFAsHUYBbTdDZ
         vxZp7ksTSTluqG8COz2+S4Maitp9RZ7h6d09nvg87qzKkZsD2srEuUTFk9DCOkAJjNbE
         TciJbeH3CIQvwDJshrlYOQge9UGb92KZZrXdm4xmlJi8JRTN9C5E81wOtmWJOEt71ASr
         bdQw==
X-Forwarded-Encrypted: i=1; AJvYcCUABNzDOPzgxaXLUP4coFw+EsDfCMuFmcZQ6l+0207bIuY9FF5hQym6LAu58pEutK1L4eqObFLP6xU/DQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzaspimij+O18tL/1yRy3mWOmPp/Y7SR7p7zmKyofgbeZWKBlCx
	DvFTbuEgiLlFtYXARJGQrIIjwJA+Bt6hUFMAP+2W3kNVdLcqut3CNTvY03mLAg+kRf+qcSk6gTj
	iK2ZqSHLBm5+57xehsh9sUr4WQZn7Aadt3TxZHHK/TMExf1ivDRuWGcaoV2PyleZ+Dw==
X-Gm-Gg: ASbGnct73qszzMr45DOLg0XdostKaQC6uAAEJ6HVcT/78EeITwypzuBqZFcswnxGnoE
	DU2NUDd7T8wl0ankHHv7oZ1RH08hTxFmqGpxplxjJcmLK1ro1Re0IRhzLmRBucRAljlS81QrLIb
	GdUdzSoW8P3VCrL82ytF9HfF2SYnBPNmQer4vI/vpm82H6PLcSa5uBlqkQWSYufSCbHRc3yqF0i
	T/WjL3aazCBIfJuPYwAUCynkOUZgEx4TQM8nTw3rGF2cHWgW7Dz8W1MmbtRumZpyiqIuQFkDrQB
	NaEo/zSH4rH7fySNXhQbH/B+Px9YYqlwzolateS26EC/8l2n7aY+4B0Zz09qeh2YygTDYzmjYZd
	24XpRL/pwg/q50XbQIQ==
X-Received: by 2002:a05:622a:58f:b0:4ab:7633:c58e with SMTP id d75a77b69052e-4aedd5400d5mr81763051cf.2.1754057022074;
        Fri, 01 Aug 2025 07:03:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZJqOtBrMXyVVQfE+UWYMn4cGgzAWWjRieoBwwyqh9DqIDo0ajPxhm1mGSkLgOOIHkgPsdxQ==
X-Received: by 2002:a05:622a:58f:b0:4ab:7633:c58e with SMTP id d75a77b69052e-4aedd5400d5mr81762661cf.2.1754057021467;
        Fri, 01 Aug 2025 07:03:41 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a241bdfsm293472866b.131.2025.08.01.07.03.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 07:03:40 -0700 (PDT)
Message-ID: <445317ce-fe20-454c-a564-288372772b74@oss.qualcomm.com>
Date: Fri, 1 Aug 2025 16:03:38 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable USB
 audio offload support
To: Luca Weiss <luca.weiss@fairphone.com>, cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250801-fp5-usb-audio-offload-v1-0-240fc213d3d3@fairphone.com>
 <20250801-fp5-usb-audio-offload-v1-2-240fc213d3d3@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250801-fp5-usb-audio-offload-v1-2-240fc213d3d3@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TevTr2SSHjOk9khxwFYvN3yW5RyzLPPg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEwNiBTYWx0ZWRfX/sTQ/rDzjfer
 9qS6OUMHLo0FWBLzqVl1+Q6N6z7FHfMmTFeQZTLZ/b1xj2fxnULfQQZ+j+eoPIEBHDjRl6G8yLh
 dD4ohnc8nB/pcFb5jnOxAXqTyp200n9WOWmxJ1B3l9h9yDSABnD32HtD2CKpOabCFzRawfyC5zN
 mkMW3ZlojC8pzjKr6uWcx4I3WfJRC9A/SjZ33k/fO1RFKqg9VQfrStNbSRH/3jG5zDaTjhjTIF6
 D+5a3XZ0XZUFc2otdm+2r4BJPPI3ShlNgIZa9Y4nA8PD6ca2JmbkhDn1TIe26H9XxGvAgzjsuJ9
 aTjr+b9N77powrNGj34KfskwlOc2VCTVHu3Ui+dhKT06jocwg22UfiucvIcMNJjNOziYW4GnOdJ
 VZQ9oTE6YWbY18arVfLw8VTHTJPWhlJgroO2wjS890iJL/G0L53FijejwsnF+v/g3RMqWGKa
X-Authority-Analysis: v=2.4 cv=HfYUTjE8 c=1 sm=1 tr=0 ts=688cc93f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=fLAofa3itH1hiLrtIDoA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: TevTr2SSHjOk9khxwFYvN3yW5RyzLPPg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_04,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010106

On 8/1/25 3:51 PM, Luca Weiss wrote:
> Enable USB audio offloading which allows to play audio via a USB-C
> headset with lower power consumption and enabling some other features.
> 
> This can be used like the following:
> 
>   $ amixer -c0 cset name='USB_RX Audio Mixer MultiMedia1' On
>   $ aplay --device=plughw:0,0 test.wav
> 
> Compared to regular playback to the USB sound card no xhci-hcd
> interrupts appear during playback, instead the ADSP will be handling the
> USB transfers.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> index e115b6a52b299ef663ccfb614785f8f89091f39d..d30912f952db271aa4fbc2570ca04b771ffef3ca 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> @@ -1176,6 +1176,22 @@ platform {
>  			sound-dai = <&q6routing>;
>  		};
>  	};
> +
> +	usb-dai-link {
> +		link-name = "USB Playback";
> +
> +		codec {
> +			sound-dai = <&q6usbdai USB_RX>;
> +		};
> +
> +		cpu {
> +			sound-dai = <&q6afedai USB_RX>;
> +		};
> +
> +		platform {
> +			sound-dai = <&q6routing>;
> +		};

Because this is SoC component <-> SoC component mapping, this could live
in the SoC dtsi.. but then 7280 is a glorious mess with the firmware
flavors, so I suppose it should stay here..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
