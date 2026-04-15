Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5922E334C1F
	for <phone-devel@vger.kernel.org>; Wed, 15 Apr 2026 09:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776245328; cv=none; b=uLM2PjqcMOI583vgxcwgkmI/0bdk9mWl46F/0y9kvZ7Pr2kgEA+rockFHO+w8Hbfq0XmonraDcQmRPUq/85E/pGEk9UYhg3Jqconm7momqdctXN6cy0fKaP/+hX7oOV7YL8mGuocfJeRZCJjIo1v0SfvF1A+isiWISVgnBDLZh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776245328; c=relaxed/simple;
	bh=2M5+CsIlZRmP5Rp+ialR6inz9ixaMSwGSxDK7V3i1vE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j/0yeGSZ8oyr+YLiRyUtryK+J+fy5J+njPUrRqq+6F9YuUFdtMULyRBLNx1jKtwqcGeZhhqxqDOaVqu1wF+tW/W6oj/X8sFiwpzbsRAl7miDAmqcY/a2TSr5lZ6ofFeSznrjYuGsxtObHvbdJGmDf2OhGqQZiTZIOGkRpEF2AhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NF3NoOib; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A3QJn4b+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NF3NoOib";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A3QJn4b+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F7tcnG764425
	for <phone-devel@vger.kernel.org>; Wed, 15 Apr 2026 09:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3M8LPszBnttqtBPzt5SqKBHeS1QcNQU5Hd5dp/o0B5I=; b=NF3NoOibaplmMS5p
	bcfH2nexAkbkvpLWKTBjpjcFWU1//E1dtwHqAY94YEkPXSRw6tOenC3tVNXBITCo
	GnjyuQWbIBDBsIPrrVc3ydotCYLZtX7nP7Sm3Lal1dGh09IuQqGM4hXNR+6QBeyy
	dGj34qWbeuY6Wm2/asTdApstMiHomDMCkXuW42iRdLaa7iBMt76obKF/qRkmxQid
	kz9TJhwAg+Dk49iYLmvs3yR9dtvWPv+HZm6NaxmsgXlC6W+aglvAj0NFuAvurwLH
	vVK4crWvDvRJMspLRMHDdAEts0IzihdtsGU5R2V/KCQXiHlSx0YytWXOXJa3XIYC
	PMVGiQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj6q7rcws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 15 Apr 2026 09:28:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8c183c2eso58257761cf.0
        for <phone-devel@vger.kernel.org>; Wed, 15 Apr 2026 02:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776245325; x=1776850125; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3M8LPszBnttqtBPzt5SqKBHeS1QcNQU5Hd5dp/o0B5I=;
        b=A3QJn4b+0MWBnu3Lx1nHEFs0KVvO7l/kpzbZpV7mQtqA1ih/JulY6LuTINGOKt5eiB
         +zmQmBKw3WVpyv0aRkmIGCM1aDDjFCLvCWOF6EPe5JSAH2rHMDr8vrNcF6holuHDwIyp
         avRFwizyEdOYVkMY47KYB7VvahMh+3SY56PEyiZHJQSqHyWSb5K2MWU8LUkPcD41V6I7
         TP+1bK/I5d7IsfF5oPgKl2fuV/oj4Aj3TZhoEot5ggSuClkys2mSXgBA2xN38W//Tn2i
         4a6Yl2aGfEFPdWnKHuaJnu1QFeu1hH+VmTWtT6prQZFh1UNbcbtaks1G+XL6M8X7hQWI
         9w6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776245325; x=1776850125;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3M8LPszBnttqtBPzt5SqKBHeS1QcNQU5Hd5dp/o0B5I=;
        b=Z7DKaqKp5hSVfC4PptWH8zakjk+K9Nd1i4i1EOQAOVNChVYv9bORYzc0r+R3wlmzvp
         RGKgUFRv7ru4O7frt9pUa+SNi6yH+mh0tklsRpYP4OM0eUH/nhRsuVSEU/NGY0J3KR5V
         GJbSrlbvj6QXocXXIIuf/DPKFqWUcpRNl2VLE4/5lXwTjHXnrEKoVCUOE1l31hj+L8Yr
         naTFUHOXIfQBsUn+uDH0JUHs4mmC9OmSbPwd7IyukAngLrzeh2e24F+ombqymmAoA53D
         FX8k/CfeNa9dxEYaFO7Y6v8bp+4x8m6pLqZxGbRn2tShCARHAdIfM0zIks6HZrtwM9O8
         AXqw==
X-Forwarded-Encrypted: i=1; AFNElJ+mR5nTCPmWfyfb6CARyGr0syiokLNjlVHXOwk97F2xe/GvxIBYXIJsItPs+iC09Qmy+hbtg9WaJ3rAEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXkib5k8o9Wdr1vJsumUPsZBtezWvou7ILYubmHuP24zwsqeMn
	DBepFI2CXF2jLj8SYdIW6iIrP8bmbSUSkgw/tU3yn7pLIzj/zNGQusgQgIYCgX+5NVJamUKvaPO
	MoTGuIelKuIg0sLS2zlrDKIWdIWQhnykEBpi5k4eXQQLJNv4sjDX+zofsdQLK11e6eg==
X-Gm-Gg: AeBDieuljkJQALAzMu3O/Kj6zty6nAp7kP91tnABeffUI6Pq2ZI/6ZAo3hbK3UaAnrH
	+UsTJ1p3Q2id6R4+ymjNMfh6Qz5ZGKHPyWCaV+FuBR9jTVCTsbLW4qguoWy/lxkCGq51GlcybF6
	NwzRELn7LcTRS1yOQGuGvJE584htESTpOkHxKbmVr0wqjRnRbQQ865nfLBwdkhdICGbCI+CL1md
	ydzTP9vSHlj4A6OvTdABydg1VjMKHRJ36vb9qkLiwyy3cxr1GnuzaZIE8doiNshe6+wuwAMCHnT
	vYD83IdRrvJJdrELoKU7m35D3i/1BUTn1Xo/3koRYJ8q4uKMBQ4zlzt6V+z7tPi8NLFvUViw5l9
	hvRJPXrVE8gvy4xnDuw3zY25tJN6NCdrVWb1bfq0eKlUa3vCO2yLvZv0FDtVBHg/xb5bWqMoA1J
	rvTxoceB/5VmVqTA==
X-Received: by 2002:a05:622a:18a1:b0:50b:3489:5495 with SMTP id d75a77b69052e-50e1a7ccf1amr15897791cf.8.1776245324434;
        Wed, 15 Apr 2026 02:28:44 -0700 (PDT)
X-Received: by 2002:a05:622a:18a1:b0:50b:3489:5495 with SMTP id d75a77b69052e-50e1a7ccf1amr15897551cf.8.1776245323940;
        Wed, 15 Apr 2026 02:28:43 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba1780b9c2dsm37412866b.59.2026.04.15.02.28.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 02:28:43 -0700 (PDT)
Message-ID: <7d25970d-c2e8-432e-b69f-0da99271b581@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 11:28:40 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] ARM: dts: qcom: msm8960: add RPM clock controller
 and fix USB clocks
To: linux@smankusors.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-5-007fda9d6134@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-msm8960-wifi-v1-5-007fda9d6134@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AvHeGu9P c=1 sm=1 tr=0 ts=69df5a4d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=wxLWbCv9AAAA:8 a=1PKY5ISNgj2KPwyAcZcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-GUID: TuLf3W8oDFpB6nyzw3RRaPrjFKJ9XcYh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA4NSBTYWx0ZWRfX0XousQSzPVBJ
 96GKFNAzOl+XVyuU9SwmmOTnJymGQIO6cCiI+Krziwotw4hPwdSlflay3gh39LxfKxk8y/1vZCE
 wXLzDJP8njWpYH0fUtbXz3/aOKtoDTwId1izwTa8JTJ2eneZq1Kx4txp4MuPtNQdYW86jR3XJxa
 lXklXB250Cm6MfDnXA5h6ma6OTU4aINkmGs21mThijCXYSrASc1kh081IgA5Lb3b3D6EFlhq700
 BL+yGBmshQkeuvBdAZcqu0kkG148xCezdNENhH7Dkk85+3SGVA0dy9vcCpWnG93iO28KmFUd8eo
 H7zXOoTLEDQ+UT4u+f/Q32l/tYTRrSQwQ8niS8pFUZSrf+RZ7TBmSR83o/dACeNdUi1jwpXgdlz
 Hcs04a9JPg3UiS3MNWpk2Z12w4RQ4xDJrDg7jjmoEFFJTOV1k3cNvgrfDABg2dSJAio/9J73znm
 ZSiyER5N4r6u4ruRW0w==
X-Proofpoint-ORIG-GUID: TuLf3W8oDFpB6nyzw3RRaPrjFKJ9XcYh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604150085

On 4/13/26 8:55 PM, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> The RPM clock controller manages clocks shared between the application
> processor and the RPM firmware, including fabric and bus clocks required
> by several peripherals.
> 
> With the RPM clock controller now available in the device tree, the USB
> controller must explicitly declare its dependency on
> RPM_DAYTONA_FABRIC_CLK. Without this declaration, the clock framework
> would consider it unused and disable it, breaking USB functionality.
> 
> This also corrects the previous misuse of USB_HS1_XCVR_CLK as the core
> clock. The XCVR clock is in fact used for PHY/reset handling rather than
> as the main core clock.
> 
> A similar issue has been observed on APQ8064, where missing the RPM
> fabric clock dependency leads to broken USB.
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> index fd28401cebb5..1d5e97b6aa4b 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> @@ -5,6 +5,7 @@
>  #include <dt-bindings/clock/qcom,gcc-msm8960.h>
>  #include <dt-bindings/reset/qcom,gcc-msm8960.h>
>  #include <dt-bindings/clock/qcom,lcc-msm8960.h>
> +#include <dt-bindings/clock/qcom,rpmcc.h>
>  #include <dt-bindings/mfd/qcom-rpm.h>
>  #include <dt-bindings/soc/qcom,gsbi.h>
>  
> @@ -98,6 +99,13 @@ rpm: rpm@108000 {
>  			interrupt-names = "ack",
>  					  "err",
>  					  "wakeup";
> +
> +			rpmcc: clock-controller {
> +				compatible = "qcom,rpmcc-msm8960", "qcom,rpmcc";
> +				#clock-cells = <1>;
> +				clocks = <&pxo_board>, <&cxo_board>;
> +				clock-names = "pxo", "cxo";

nit: one a line would be preferred

> +			};
>  		};
>  
>  		ssbi: ssbi@500000 {
> @@ -507,8 +515,12 @@ usb1: usb@12500000 {
>  			reg = <0x12500000 0x200>,
>  			      <0x12500200 0x200>;
>  			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&gcc USB_HS1_XCVR_CLK>, <&gcc USB_HS1_H_CLK>;
> -			clock-names = "core", "iface";
> +			clocks = <&rpmcc RPM_DAYTONA_FABRIC_CLK>,

I still have mixed feelings whether this should be a clock or an
interconnect resource..

Some internal data tells me this is used by:

* USB
* SDCC
* GSBI
* INTC
* APSS?
* BAM DMA

or anything that is adjacent to SPS. I think any/all clients vote either
zero/off or 64 MHz, on MSM8960. It seems to be an IP that wasn't really
used for a long time (and a long time ago, at that), so it's difficult to
judge.

I see that the list above is roughy in line with where msm-3.x attaches
the votes (also for QSEECOM and friends).. 

+Dmitry, would you know more?

Konrad
