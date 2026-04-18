Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2864B1A6819
	for <phone-devel@vger.kernel.org>; Sat, 18 Apr 2026 17:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776534370; cv=none; b=CJVeey0awmVgiRVbZ5nfhfGSaUQhBT5lTU4usZIFHNCSofls6iteOQ4vBz7PA5vxEDvcGBLUFtTSC2L1V4IywX7gmIrxfj2S2el3rnKwUjG7vJUDgv10WqyQVlEV9FVKOtPDzsdmiXN1mYo4LCxDUJh4Es18e6hl9DTSOc4Duq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776534370; c=relaxed/simple;
	bh=p75owHz31Spj2lquCMgQsUw/v+xHw/FCn5vEZQNSKf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eFkc46Y6fI+0pdAjy2tPqgnCZfllOMq+/uoKi8LRv3EMzPtwosfX8kcvA5aTMUf/walkOPXgSzDYObM+2M6bZBbBImzgbMUaNRi/DoDyuXu5PWnC12MpZdt+nfAxdZPzP4ZkIxc4J0nN4EHVpnfJ4bgPgOuP7ot341j+anSwWlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lXTel2B+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XKI32qcn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lXTel2B+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XKI32qcn"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63I4UOZA3679776
	for <phone-devel@vger.kernel.org>; Sat, 18 Apr 2026 17:46:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+ElieMQRQ+IaCgird5S6d7Z0
	R9V7rrPa/yv+ivDtIYE=; b=lXTel2B+JftYcKujqnFYSqitGcD3AUy0yUemkvg7
	0WAVML8jpeo6vEq0rL/r0UieBTQfioUjHu4l7GRuwBUUxtUSolkBIqjUPYuNQDCK
	bwbmHXE7/Co5ME2a6W/S8TZfPd5Zl+KmjpieOFBkTBtBr/YBMLwzXcg52aNt7wRG
	2uC2cMcHoU3RkG1BTOOcd6v9bQb0PVFihUbBJK4kiETzJJHI7P82tbVHj5/1boF+
	j8p5QXHlaWC1iyauSs0Ojh6meTH5E4X9/UJVRGTHN01CKzemGV+7aTpkcBq72O9P
	yXHPGlCtwP9y9J8h0v31QH/RVTU9BbKU2LgwiGnbmnsswA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm261s8eh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 18 Apr 2026 17:46:07 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56f71e90581so1449540e0c.3
        for <phone-devel@vger.kernel.org>; Sat, 18 Apr 2026 10:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776534366; x=1777139166; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+ElieMQRQ+IaCgird5S6d7Z0R9V7rrPa/yv+ivDtIYE=;
        b=XKI32qcnatWqdTjbwC5lNT8aVzaSiJT2CGNUk+f6oDhxOWkyWDtywrePjTRQWFb5v6
         wQDXRvYz4EUCxZ2oC0OWh5Yfumuqwyd4IyhRkCvVVjxmk3NNZ04rwUswDuuCw84j89+x
         QDygrQg/i/R1TPWn0XqwqttFoid/0yDbmekFsuKeLKPGdxWiMMQLqMb4IJAz0FAHnVYz
         mMI/9ogJvMT8zAtexst1r+kou5na4fUWrS90XlA5UQncaRLPiUztCrKwCh7U8gQJkaGW
         Mdkf3VYrkQBcy206BGZ5LQ+QVUjlyig8oDnfg0G7Gu5QpcbTgg60btmpSXmJK/gz62yX
         M7Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776534366; x=1777139166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ElieMQRQ+IaCgird5S6d7Z0R9V7rrPa/yv+ivDtIYE=;
        b=JqS1aIioFW4IkBqd3iR9KJFlJMXPm5yIzIojDsvPinj8neLNYRsPr7DRnHYZSW4LKa
         zZhfOV2KG4XDDt5oWG01q6rFKO/sE+ZCzIR8flU1cV5jBidd/JJGfJGaHojwjPKgjoq8
         XYa493PIfr2m7LJOxiC9uNB2pFGBhxkV4eQBJvpaNALHUwcUnp3ia1zEJ92T0BJp+YDT
         AS9KrwPv3pgTFlvWL1yCabXUv8UBI2+PgkbMAGG2OFKaqrXzop/3VywcCnrNs8IQZ3kR
         b9aZ3nWgZLZlwQC5fglV42Pjqe9eGgomvjzvu86TsoZbLj4zwtvEHfhnqGZkoVicKR52
         taiQ==
X-Forwarded-Encrypted: i=1; AFNElJ+w3x9eJkwAWc4DKDG+LAcFegnb0U8Xos4tnbW7xjUUqkN/tiIEgixT27STVGfUYDrIb0u+6bE/9l2ZIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPoiQ/NPoB6KX77I9I+eTfK8KNn3/1mZT+qY8EGnn0diagM+Sz
	zwGA7CnRwU542En9shPAadmiFwi5mAc7YUwRafCQOsO6hWlibaJQIqSuU0XIcyKTjQ60cJ7E3pD
	wmaEoUpnLMfSNg7HnEcwJ4g6ihIoPjJWP+wSKIXYa3UGgNyD8nH4OHBma4PzVR+qN0g==
X-Gm-Gg: AeBDies3viVI3rCLrF5GLbN712xmdcBVrU6UNCK4HT9UDo84Y2D09vloeUPMeojpGXC
	DbKHaB39iShi6ZG3sj8s79uc+BvoVUnKyOykr4nnWon6Cqigym/IQqhaO0NwOxZA0xmwcQ3PiGK
	4F5MNMmDGw03Kd5rzHijXOeItCnF/axOyxeHrUEQLeTSWLFUqQzvKBsH0Mnpf2ezWvQ/vxbcQjB
	p5gulkhHIUfoAVkFENaAD1f9bC2RyGFVe0TxAaeOv67/T5/EM5z+79qzhUsP3Ai7bTa73Q9xn5B
	rW1b8wNuUQfoOdwhRb90s49POMz4idZFokSQHQadivOYqt/njA+rLTC+6Lek+VI/4oE7y2ozdqc
	IGKzdPNFq9ki+Yv8JzWaXJuhuuyWW1mQdV/cFXmGZ47v3YwKJtuxV5MuRfghwAec3TiFzxHGCAK
	WrnbYLQ8++6uiETahd5G2AnP/cRrtGqsErfzkUtEi50kuTow==
X-Received: by 2002:a05:6102:1622:b0:607:97ef:4dae with SMTP id ada2fe7eead31-616f68d7659mr3519440137.16.1776534366339;
        Sat, 18 Apr 2026 10:46:06 -0700 (PDT)
X-Received: by 2002:a05:6102:1622:b0:607:97ef:4dae with SMTP id ada2fe7eead31-616f68d7659mr3519427137.16.1776534365852;
        Sat, 18 Apr 2026 10:46:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb4f5591sm12047671fa.5.2026.04.18.10.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 10:46:04 -0700 (PDT)
Date: Sat, 18 Apr 2026 20:46:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux@smankusors.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [PATCH 09/10] ARM: dts: qcom: msm8960: add Riva
Message-ID: <itpbvjiszlgw5fibftm34ua6tufbiwentswju6npwyic6crnup@7taarqd37zva>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-9-007fda9d6134@smankusors.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-msm8960-wifi-v1-9-007fda9d6134@smankusors.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDE3NyBTYWx0ZWRfX/sWSbRsyXKwj
 ep4FUmHfmWqn6QcCGEoOuaLIvlbx6+CG6qTTzXdwS1QHpdzpLxCtUne77lu3DQFlYyzrxJTsnix
 vv5bOzsGdysXnCwpydnX5uqA5U25VNMTKFZ5wAJ52C0IFq91C7bxp+vNsMYursJ5oPUGPIvw+XS
 ci+8Y2BL32w+zBVr5LLvV5gvHAk+L9KfQmHSsEI2iEtaAn9jzxefCsO5zFciC3f/nyUTFlubD+y
 9j/EIi1kPOQOdi5mp0Ceblq+MAtSOxctSE2PvA0nyG6t8F/zcIR7I5J7ylNG+WZZmz9rwzRo5Xc
 KrLT/ngtE+qkBmbX5M7JuAeEJHj/SL+7EaB80TykMQX+nE45W7FHuglGkTikfLmJwBj9EiIJcM6
 i5b8jMe+Tv0nBLa+XRLzj0fwW5QG4b1b/n977Dy3gXSmyyFwG6c8Rta1qNPytMubcK7qXvfsuUA
 tebsnKalI1LQ4SONd5w==
X-Authority-Analysis: v=2.4 cv=dcywG3Xe c=1 sm=1 tr=0 ts=69e3c35f cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=wxLWbCv9AAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=FVDmf5lRyKzVLZMU-LEA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-ORIG-GUID: a2G_MnH1FHlFk5KwGllv7Z1lvOLWCYZx
X-Proofpoint-GUID: a2G_MnH1FHlFk5KwGllv7Z1lvOLWCYZx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_05,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604180177

On Tue, Apr 14, 2026 at 01:55:36AM +0700, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> Add the Riva Peripheral Image Loader node to support the Wireless
> Connectivity and Networking Subsystem on MSM8960. This includes:
> 
> - Reserved memory region for WCNSS firmware
> - WCN3660 iris radio controller
> - Bluetooth and Wi-Fi sub-devices exposed via the SMD edge
> - Pinctrl states for Bluetooth and Wi-Fi power management
> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 78 ++++++++++++++++++++++++++++++++
>  1 file changed, 78 insertions(+)
> 
> @@ -456,6 +489,51 @@ saw1_vreg: regulator {
>  			};
>  		};
>  
> +		riva: riva-pil@3200800 {
> +			compatible = "qcom,riva-pil";
> +			reg = <0x03200800 0x1000>, <0x03202000 0x2000>, <0x03204000 0x100>;
> +			reg-names = "ccu", "dxe", "pmu";

If this is going to be resent, one item per line, please (for both reg
and reg-names). Align to '<' or '"'.

> +			interrupts-extended = <&intc GIC_SPI 199 IRQ_TYPE_EDGE_RISING>,
> +					      <&wcnss_smsm 6 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "wdog", "fatal";
> +			memory-region = <&wcnss_mem>;
> +
> +			status = "disabled";
> +
> +			iris {
> +				compatible = "qcom,wcn3660";
> +				clocks = <&cxo_board>;
> +				clock-names = "xo";
> +			};
> +
> +			smd-edge {
> +				interrupts = <GIC_SPI 198 IRQ_TYPE_EDGE_RISING>;
> +				label = "riva";
> +				qcom,ipc = <&l2cc 8 25>;
> +				qcom,smd-edge = <6>;
> +
> +				wcnss {
> +					compatible = "qcom,wcnss";
> +					qcom,smd-channels = "WCNSS_CTRL";
> +					qcom,mmio = <&riva>;
> +
> +					bluetooth {
> +						compatible = "qcom,wcnss-bt";
> +					};
> +
> +					wifi {
> +						compatible = "qcom,wcnss-wlan";
> +						interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>,
> +							     <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>;
> +						interrupt-names = "tx", "rx";
> +						qcom,smem-states = <&apps_smsm 10>, <&apps_smsm 9>;

The same for interrupt-names and smem-states.

Other than that:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> +						qcom,smem-state-names = "tx-enable",
> +									"tx-rings-empty";
> +					};
> +				};
> +			};
> +		};
> +
>  		clock-controller@4000000 {
>  			compatible = "qcom,mmcc-msm8960";
>  			reg = <0x4000000 0x1000>;
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry
