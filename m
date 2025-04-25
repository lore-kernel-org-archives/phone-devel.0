Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E426A223DFF
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 21:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745615209; cv=none; b=pdTPf3+L0csr4/1bnlg0K+YDSchulOTxjIerEBzgV+mZYt/sDMlu4st/WY/Q+oWM9WJ5ALYEK/prYqH+YPTnk4JHEUvZdtB0GkXSaksAer4whfMB3y8QaKm7dvA9msJkzSo/3mZjK6Q1qE0t96ASR3VTGQzTdJfF1vjDF3PKpYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745615209; c=relaxed/simple;
	bh=h00jeZq0iWeQNWIPqYKYS+5WOPWO32a5C7YtUmmJfdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E2D0fFg0n2o38T/p+EUdHIr1hwafdx1x6klUW2cszY9kosfQCsI/SHKOdDrby7NfgkwIot2ZD/ki/ibum2TSJmbx9zzAQxBKbg0oreG9P4/OaD3a3MXQtL/kNx35UD21UvPUJHaaJrCvi1wCMKw8D5fq9oWbuPCVpj88ZyoFuK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LuqGT/Y4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LuqGT/Y4"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJvmj024813
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 21:06:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wMN4f5Q/NYPt8cjlej5JofRiRc0TnEknbiNnEj2rrn4=; b=LuqGT/Y4ATlFoSeK
	6vQEqqPIeptD1kdRNXtNbIaV4vgVRGDaqx8n71p/mrblpVqHMPtNsPvR5tDW6jox
	k+QHszpx9gCcue/HefHO0m3o6OwANCIlhr0TsYhYCk7D0FMVXYNWWLuPLhzhAzlD
	mygQ9LVI7bhAb1bcxpOPrpuw3mfOHTfLw6yqQlGJ9Cc/BQDFrcDqRPg6e4wJGgre
	l47cIeQDlXKwqXBAoPela/+SpS8OfYmlAlYmjEHjl44Ynk8wihKbpEksXRrTuI6i
	v8Nhpx/lnz+GEmSU14fbVqEKqPGYWPPUHQVRQWujFtS+lN9ROIxbcMjOJIN4vd/7
	VwKXRA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0t5qg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 21:06:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c76062c513so56130385a.3
        for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 14:06:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745615206; x=1746220006;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wMN4f5Q/NYPt8cjlej5JofRiRc0TnEknbiNnEj2rrn4=;
        b=RDA+/1YrG93BBx2A3xlLo4LrwOr2CtvWPPW+BOT4njiiFfkqO/JBTXfcEPcbLxEOl0
         3R/Oh1ZxIYBDds7EDDilmVJ7LhpXDWuwo7+J1FUZ8JYpg9MCijQhTkgq95ZdYMaLRDp2
         OpW6mmIPx3TLjXy7TA0fDKOerpTyGOSBuHyk/sepW05DbSQGEEHrM0z5H2lFFcnLcxkM
         bJFh5fTLEbk2cAqa2Lr6d5Q8FELjKDDkdG/HqjpjBkqjTMGS1ot6ub2VSJ2YFF6UOkGm
         mngYvKUUb6MrTvwRM2ix05UfPsW6VbQslIG1G0RTOsoYzmEY8BMBEb3b7zjYpLfeeXzW
         VXnA==
X-Forwarded-Encrypted: i=1; AJvYcCUi1vfnchBQA63V2QnJGU3Cx1sOay8QeEDp4AmrLh2QSux/K9k3IceRBWJiIpr8Nf/IovnII+o+IImn2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOG+4DfI2ObxH94ZHZf38iEgAIgdz//HeEp8f271SbnkogYRsa
	1cQmhxSp9AQrDt0zVi9f/T2szIksRsqRek21bn0/MCw3/z++UfZ6VXjNOhpC5C/PXGewLgrmKqN
	hMbL8AH9rCJYDijMSecN70HADiwv3lfFQyY+Mlut1rQYcp3GS3NL8gtQaeIPWKw==
X-Gm-Gg: ASbGncuWPoN+9k8Uyip99WgQoWFzZiC1tNzE/ui377JQ+Pgyt6DGl5hkwUb70SBIvZe
	W/o6qB41pzyhQDOBqExyuBBHRKz9iCvchU2iMY2GtH0RLPF+4KB9HlWoHY9Bu9TlKyeyVvEwuY9
	HMGApXCfnSTOllRER0kfC1vY3s9B87T/7mfaGnXxbQsNkAws5+hYXspig8MjwQ+pbwrleYGfGKY
	j3vTWdaRPNWJpD8Gw6qbcs+Wmfcn7HBfJNSv35WqezBJ2WuLp2ng2NJXvO1AR/pXxGaONYhCVqk
	Y67hc8rrljXKdbo3eydQEoWS1wtIKpNpHgTaSskH/D2nv5f9TS3B4HnZbOLEMBpprcE=
X-Received: by 2002:a05:620a:288e:b0:7c5:79e8:412a with SMTP id af79cd13be357-7c9606a8ad3mr242922385a.2.1745615206034;
        Fri, 25 Apr 2025 14:06:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhpInaWqBrWslLMEBHulOhEbn7os56AY7sdqmyXhYs3h7/KUwLESO/GdOIrc/pcmlw3H5y0w==
X-Received: by 2002:a05:620a:288e:b0:7c5:79e8:412a with SMTP id af79cd13be357-7c9606a8ad3mr242919085a.2.1745615205574;
        Fri, 25 Apr 2025 14:06:45 -0700 (PDT)
Received: from [192.168.65.156] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edafbf0sm187232566b.168.2025.04.25.14.06.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 14:06:45 -0700 (PDT)
Message-ID: <5c4ed073-45fe-4938-b25b-8979d96b456d@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 23:06:42 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm7225-fairphone-fp4: Enable USB
 audio offload support
To: Luca Weiss <luca.weiss@fairphone.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
References: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
 <20250425-fp4-usb-audio-offload-v1-6-f90f571636e4@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250425-fp4-usb-audio-offload-v1-6-f90f571636e4@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mZHdRUPm556N-ctAvni9mN3BAE2ang3Q
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680bf966 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=fvTAydqcfIHFLh8AVZMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: mZHdRUPm556N-ctAvni9mN3BAE2ang3Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE1MiBTYWx0ZWRfX8F03inJt/SwB AOXyPSVDFvds3rfzwnwdjmrooGgR0lsbfVKYM81n5mg92IsolEzCQujfNhADfI95mrZj5QwqvtA QbICZmyPzOO2XI/Pjdt2V4/s4V0R4iMtbYgziqp5TYlUaQnJTkYH13GfatMegRaoJyWv2fFVx3V
 xhq19E7kLO5VlS44OhnCoryipbugf8S7+0/8Ovdn18Gxe5MjctvTewNr4V5+XZV4TVtUuKA3UpF 12wDL6RssqEzRbN/ceMVzrWwzPz/ymeZlAVEgC9xjA8Ytm8J0OW+GArr/rvNBlEgM+DesN8a1Nm ZnAm45sXH9OmOFkkeQSTOeXUD03+ZbNSFC0ymWGRXM6kxDJlhjHn9879gIg6GkFCk2nUEcycOQk
 G5SHy0Yew2oUjTzbUZ+C/i1R/coXo0oeHx/r3D4Fmc4w2mSkkiXJ8TX+Hxaa5i22i5xiHndZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250152

On 4/25/25 12:44 PM, Luca Weiss wrote:
> Enable USB audio offloading which allows to play audio via a USB-C
> headset with lower power consumption and enabling some other features.
> 
> This can be used like the following:
> 
>   $ amixer -c0 cset name='USB_RX Audio Mixer MultiMedia1' On
>   $ aplay --device=plughw:0,0 test.wav
> 
> Compared to regular playback to the USB sound card no interrupts should
> appear on the xhci-hcd interrupts during playback, instead the ADSP will
> be handling the playback.

"should" isn't very optimistic - I assume this works for you? > 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
[...]

> +&sound {
> +	compatible = "fairphone,fp4-sndcard";
> +	model = "Fairphone 4";
> +
> +	mm1-dai-link {
> +		link-name = "MultiMedia1";
> +
> +		cpu {
> +			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
> +		};
> +	};
> +
> +	usb-dai-link {
> +		link-name = "USB Playback";
> +
> +		cpu {
> +			sound-dai = <&q6afedai USB_RX>;
> +		};
> +
> +		codec {
> +			sound-dai = <&q6usbdai USB_RX>;
> +		};

'co'dec < 'cp'u> +
> +		platform {
> +			sound-dai = <&q6routing>;
> +		};
> +	};
> +};
> +
>  &tlmm {
>  	gpio-reserved-ranges = <13 4>, <56 2>;
>  
> @@ -1178,6 +1214,7 @@ &usb_1 {
>  &usb_1_dwc3 {
>  	maximum-speed = "super-speed";
>  	dr_mode = "otg";
> +	num-hc-interrupters = /bits/ 16 <3>;
Where does this number come from?

Konrad
