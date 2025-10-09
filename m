Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC133298CD5
	for <phone-devel@vger.kernel.org>; Thu,  9 Oct 2025 14:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760021028; cv=none; b=EVJ+d/WPB3RaUaixmzQvWG46Eup/pGElAclfyw/4c/1OOnX/jLagilSk2QaOjhh03jbYgUv2NWtSrjZxfvs9i74SXPHUHS7kHyrpQN13pORFrOfZVFpTwb+/X23nMfhWwp0vKrcDmo7VbNXrFn4I2a0uSZFm6KVm/0lvmYTkvcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760021028; c=relaxed/simple;
	bh=YPRTmJAiC9PVnBhnzgVMwPCuYI3/xLbW6iu/nD0qQM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lZhlmz1EhuvXlYa3ejLLcDq2U9Z7haEHSQt3Yw6jT7XWZNGMSgVduozFWe90HBeWUKnPpHFuuCz2faMgnzxOsNoZkw9P2Crrr9Fbqdu4yEKbis2MxMIQf+5Jkj8grIQLHac3nTpnbKQQe8PnMS+rYkr7wPJK5e5M4vdMcsIYV+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dFl+dQt7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dFl+dQt7"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EJt5022315
	for <phone-devel@vger.kernel.org>; Thu, 9 Oct 2025 14:43:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RAZH4VC4YYHQ6vhW18teDI4p
	FX/oOp/YSqgiS6ax0y4=; b=dFl+dQt7KQmjjst4Rj1u/l1+XUsbjL6mzSC7XGCy
	qH5Lt7HCf3kKnGoq/cpjA9m/7/ZxMFClL4iQ19w01YNYVjdc5Om1p9nWRa8wq3O1
	vZEmPOyKVze4NDs0L+Ej1KcsUdzW5Nj8T5yvdKXhE1fgCc2tbgtu6HA3PyUyyLfw
	nxHBUmGQmqwIy8wtKmzhXQDE/ot8IOLHZ+VR4n23Wot5ofcjBUwRg1yolNS+Kbsn
	Ntk+eUrTIlvTHNNpV8bD1fqpeSwkDKwnOWq0YTxVt1eLqbF2UZQ1XlRQiYfMbnml
	iBBYkSqgtW97vjU23EHKW9wEqNjccxy7w44pwbRVLi4SsQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4sk6wv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 09 Oct 2025 14:43:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d602229d20so26984201cf.3
        for <phone-devel@vger.kernel.org>; Thu, 09 Oct 2025 07:43:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760021024; x=1760625824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RAZH4VC4YYHQ6vhW18teDI4pFX/oOp/YSqgiS6ax0y4=;
        b=r1g5oHU/TQUE5Wl16E/sYDOdpieI3XuwXYtc6AXvq3wokXiO7gszdlDA4kVYbaKUzn
         GrlZQ7psuKt7YxHoXyJfzxbtd2aGucfcGn9Y5Fn0oOvVVpsFtRGO7QtbFRBqeboKe5AF
         vSkcJ5eV24V1eupUw9lxkikonIVm0Csy/MskWb6DdP3tcJfj5V84BTOZ3z68WbPTW3x8
         tzpD5oVC25cKdm5xdiZi6j6W/UdBBqafiM9WoWgKMB6iCTG0nWp8MiK8qp+JdyZz4cNc
         TV2mqo5KlRE1VOmk3HraFKAx2eIikl/LzX1mRoTp2wTjyiVxZy6odNO3O+2HBB5V3G40
         nBuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkqLiqwMhpeLL/pCUDy0B588E/9sXN+66DI/e0ylSUuWgI01xhDZrS4mJ5HTs5lafpagGfQRxycJoYRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVgJ25rDOy75Q/6BA3zP0BbgfWFKAaPXO5mH2HOC7pazAs/61+
	FsntmB9T91rJ7JBxAT4dj2IDVLcRVkdRBgmDbngST31jX0DmiHDOtqkiA+1HJb2F+k9z5c368fO
	xAd2myV+9W+3RX5xFuBjfcBD9of3PFvR9UsGO5U9XjkMFbeV6VmY+t2jSLYSQJ/Uc9w==
X-Gm-Gg: ASbGncsz/WBmPnPpqOhUkADcN7/ZguX9fV2fBl2vtRjmwP2agC7LSlrWSfn1lvIdvX5
	r1+LORHTN/ght3Mz4sTIWu5qadx5D1WNdwPq5Q5D3wLuSpNENtZBfYMXQzWlrG3uHp5KEUFXX11
	/a0vzftmkI+Ley/coZxYc5mwzloK0c3EFFBs4ySkSgcJnFpJ9rN8btkfmrQziVjYSXZZQ/7KT8e
	z9NyYOUUJhERb4iZ8Df9IshaBI8HJ0eFOeqTEawklMkaN3lJsxHhyafAHJAp4MZ+Y+JmQUczNrf
	cSqQDmKatNI4DQgOWmBxw1yu4sOdEIc1T5CztWe71ZFUv+ItvJs3x7xaQNyME/1DOcKbj6GxUd3
	SuDaMpAr5SMswAL39lRnko79keFlnRLgxSCvYD313T9Dnd0SuinMzHMNUpQ==
X-Received: by 2002:ac8:7f89:0:b0:4b5:fa2e:380f with SMTP id d75a77b69052e-4e6eacf39bamr101335641cf.27.1760021023869;
        Thu, 09 Oct 2025 07:43:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4VQzRJazCe5lQEKqHSB+Ox+znELuwpSDAoZB258VOx5j06Ir/+zHOtX7IKN48V2PCiISpAQ==
X-Received: by 2002:ac8:7f89:0:b0:4b5:fa2e:380f with SMTP id d75a77b69052e-4e6eacf39bamr101333161cf.27.1760021019850;
        Thu, 09 Oct 2025 07:43:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5907ac00be6sm1099313e87.23.2025.10.09.07.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 07:43:39 -0700 (PDT)
Date: Thu, 9 Oct 2025 17:43:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Alexander Martinz <amartinz@shiftphones.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: qcm6490-shift-otter: Enable
 venus node
Message-ID: <si5h3szt3msd7mcbrfdotbs7wxi4bh5cfgp3icoxuqprsz5tqr@tk42ox6okse4>
References: <20251009-otter-further-bringup-v2-0-5bb2f4a02cea@fairphone.com>
 <20251009-otter-further-bringup-v2-6-5bb2f4a02cea@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009-otter-further-bringup-v2-6-5bb2f4a02cea@fairphone.com>
X-Proofpoint-GUID: edcnqUSKXTVoX44MhJvqMI45a8hcMIeK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX5w3xn3bWqSIb
 ZhEtw6YDBwpe2PPdrB09Bnp691weR+0bU0Se0oRuw+Vvsr360ZtnE/ka/Ksp+6sm21ZFypKaRht
 blzF55TKexWzlZSkGUF8f0qAftrFilNOSJUg4lWpQHQVsR1NT2TTJdJpjBcw3vHCQy8adoHutr3
 gmstEEVU6mmwnamCneO2sGKj9Ige3Lf7kxvgjyUUg8HviBMtHoTl3+PG8omJHEpO0DwCN5OJ8n7
 F0ppAL579GjnkVxwJtSYvDcuT+l11dyItDrYSC0PJhKo20kAcaRXVOQwaeLxzLil9vOGVUGY0kQ
 /5YtjgBik+PqWcQm00mQatGrKQwc4WcD4RIHhr94f5YBhgu44XRVreEHOtpkcZyTLtecVbdGD/1
 Kwz7janUQdV5OeTQjV3gbgPUg8JSmQ==
X-Authority-Analysis: v=2.4 cv=SfL6t/Ru c=1 sm=1 tr=0 ts=68e7ca21 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=7Ovdx5uLAAAA:8 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8
 a=5-T4x24SdKi4UNUJpXUA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=TQZWkJv5rNK5-PaLMsrg:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: edcnqUSKXTVoX44MhJvqMI45a8hcMIeK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Thu, Oct 09, 2025 at 11:06:36AM +0200, Luca Weiss wrote:
> From: Alexander Martinz <amartinz@shiftphones.com>
> 
> Enable the venus node so that the video encoder/decoder will start
> working.
> 
> Signed-off-by: Alexander Martinz <amartinz@shiftphones.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
> index af6f7b41201d..a3e6b6a96530 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
> @@ -981,6 +981,12 @@ &usb_dp_qmpphy_out {
>  	remote-endpoint = <&pmic_glink_ss_in>;
>  };
>  
> +&venus {
> +	firmware-name = "qcom/qcm6490/SHIFT/otter/venus.mbn";

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> +
> +	status = "okay";
> +};
> +
>  &wifi {
>  	qcom,calibration-variant = "SHIFTphone_8";
>  
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry
