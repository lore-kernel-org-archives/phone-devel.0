Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE53913C918
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 11:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773659763; cv=none; b=Iqg96LIdCnsisUZ/TAm6mHTx7/1e8gE4KXD0G7X+4eD6xf3bsTrhnUoqv0TTnm98kCNlvi1mMyzL/Vyy0px7pQsMs56TbjoSXBsI9I+NvGmD4KBrhe94ynhCuhw3IYXgN2oLDm0qQVAHTT++z1VjvdFq+fl8sc8tIzaKbNYOPwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773659763; c=relaxed/simple;
	bh=esLUPOOWx2BE2RIaFwDSmG6sMCM1hS+EmMydfYN/tsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M2uSij26oUGkJ8ePgAYYLQh/w0bpc9THeeJFSgKP/g8v//O1iQz6KWJbr9Z/XgmLe29/nT/dtyA+eByaXdq5ywuvylIauoUO9P9hbktPum/JTtPkJZXrPtm5GP5LHfQoNI1jHfUjGYgJIuq9mX5jvzmUNc3qT8PjdcDdokxMzBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cDIKhuKb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ghUabPJI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cDIKhuKb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ghUabPJI"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64nCs2128647
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 11:16:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7XllX3Ebz4hppz9fzI1VP/5MLoDsPPNQg3TBzEGzGm8=; b=cDIKhuKbKcmjkPnj
	4BNlBxp8U49u3fT5ASTNQ7cvUI3DMFWh+ZQyg4wgV0bIHzFX4qz5vZ2D+dU3fa6c
	MnHm3RZx/YHLWHwvUL7wyc9rxqSpMae3t8Bgyvx1lOe2VHqRjhIB50l3BviFHZCT
	VlO4ECTTKXfy+d+9TUkLc6Ja0w1a3DrgWjN3cZ61A/5D0c9wLa7Mxw/ArkjAbEzk
	GOXofH9sxZvUonU9iP/MJcQprQb2tUkjsyd9LZPUJD+eR6oMHZmflCr/4TgkQEVU
	8Cs9uGV3dhfMpcw7tpjjyDYnpcXZAHAt9sNI24MqSlMWirJbCZREdUCYztRiudej
	RvR3GA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw00anfs7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 11:16:00 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-128edc72e5bso4779547c88.1
        for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 04:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773659760; x=1774264560; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7XllX3Ebz4hppz9fzI1VP/5MLoDsPPNQg3TBzEGzGm8=;
        b=ghUabPJIHmnM1YyubXRKdGcX3krv/e5HltwwXNddAcTvRzlRmrFdpbsvekv4PQqYwF
         AbmgKSEJ6MgYv8rhVFGytPEuzyWPiCFzBjaQj/sAWUpAatfhDxCWr5GaPZqgajVkQNHK
         aeCZ5mZd+T+mDLt4EgHU2HBahPAajoxmPsHYkZuJvo8V3dWsmQQZ1LmzDEJuGQP4tJmT
         K27BGLmZZ0EgZ2SOpnxHrkkq+/1BsFHQCfoE213FzIC/jIh1ff+QvfrHMYvL/Hrcu4Qh
         zaRRylyd+7CpBlQ9WzE7ZhgS3+Z0FbrbyOR1pPpjoJ5elEDFtgV2DHNxaVo4G4yRJsof
         7pHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773659760; x=1774264560;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7XllX3Ebz4hppz9fzI1VP/5MLoDsPPNQg3TBzEGzGm8=;
        b=r1EY3MJJwytc6BtA4utjyrWvgm8ZYFGH6SdRYz44c1dsN9Aj7jlIWXz9bjpQua6mZY
         D5dPN/huWPB8oJYZrWK5tutnX3NpHgARtV2FcSoZHLKsVbSGfLm3wAJuvmq/gxyCI5/r
         aLDvM4f3YuGOlkbPhwXPbDcGLU14Ldd9N/bWeACvQY1gWmmr6J1wYQvtDasQf2A4Rf2J
         iaPiH0iFQEuGRj34OBjrBeTpZbkgRgnOcPc5Tyr9XHM0rAh753OSN657AnLZnWaNcEE5
         T5EHxvkZHeRWOiyoZsab3M5RWEaQkw82IuRWbOggFjG9bZFHcI2ygQP1v9zXJbD6+FlM
         de+A==
X-Forwarded-Encrypted: i=1; AJvYcCUJqYhWgaWR+zyA0TkvlxItJjx3WVF/I5xODrsMBRICTKjPtEihI9iiP58HQjSx0E/OLgZV7O4PWMQ3Mw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi7JLH6/dON5qOaXZcpBwWy7ST6N5oHVX5HFmbzSSthEb/4+eT
	Xz9Ujzo/V47ybh4VS5RknHLjDVFlgEb/10Bby2650U8NwmdLVZ2aYyfOeUDcVsV+4zEHJ5RBx4h
	CYUEUKGlL6DVtV11JIwM3KbGLGAzFs9F5OjjDM9tPIOStLOAAoTTZRKfQvvmjHP7AiA==
X-Gm-Gg: ATEYQzy51t7TadjuH8/Zjk+Bn30r9t65/RdcfC7uFZXF6d1+YyZAxlqUu+S7Z3IxO1f
	+wIrB30fcGpRv470BBibEVBMg37wbQKi0gNtuljdxYrrVJ0rC4QPyZvfukM0dBibklLLXFK+LLE
	aHtVV9yZZUfEkanueBnbq7jpsxYKSACrPJmpZ74JTxQ/QMz2rUm1TiDu1jK+sTLGpCBJ0PrSqpC
	9obY/44wnNXsvhvAyObecbmVq/t1WhXjKfXp8tvolDgOolb4qo71hLdQ/UjPx8mv2A9tp1CwSUH
	yMIdyvyxVLdECCtxxzkkioa1TDv69wSPARMtt38ZeRISJc8qxe5GXn6PtsRseJyxmPO85CjO2p5
	Xkr4XyxDFd7cbhYT7Bb7g6sRBz1CxGicbdCoi+IFmzKKXxqmi4d9D
X-Received: by 2002:a17:902:f60d:b0:2ae:5bee:f0fd with SMTP id d9443c01a7336-2aecac81c51mr139277605ad.51.1773659088589;
        Mon, 16 Mar 2026 04:04:48 -0700 (PDT)
X-Received: by 2002:a17:902:f60d:b0:2ae:5bee:f0fd with SMTP id d9443c01a7336-2aecac81c51mr139277275ad.51.1773659088059;
        Mon, 16 Mar 2026 04:04:48 -0700 (PDT)
Received: from [10.218.5.182] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece7ee1e3sm112165905ad.44.2026.03.16.04.04.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 04:04:47 -0700 (PDT)
Message-ID: <737eae95-1e86-4ee6-abec-5e313a18f078@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 16:34:41 +0530
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: milos: Add GX clock controller
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com>
 <20260306-milos-gxclkctl-v1-3-00b09ee159a7@fairphone.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20260306-milos-gxclkctl-v1-3-00b09ee159a7@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: k58olFmwIw1lfNqgoRMG0oD99yXQL5bN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA4NiBTYWx0ZWRfX7/lFIGD6DFet
 iPLwaJWuJfF2djHuZOl4Y85jj/eCf4fajYxTU++/4VAfag0eMT9pwND0zTWUkhSMLdB8z6t6QWG
 lpyWC73Xuz+bkSoOoZ2XzaKm/6qeGAF/0KlNztzTY8S7FEHSGiI7EEbvaZvx3f/VyOSbsuFRIqM
 MQCerR3V0oS6DDew6oE5gmfeGMwPd6ACp6ujw1ZIQs8QBHcUjldjcaAktFGMLA8AtU5HWkEsHeX
 /LqyvJuY/wN/Nxx1sZl6Kv+5YuY66Q57jNFzgRK/JYaTvFz1asr0FoHQzh9/WtlLZ/sEL3XVWBz
 Np6RyORSWQl6+e83aHYJylEz1D7JXHTzE2fkR1b1lgUuQK6l6JD518FB9LLaTiYSHW+2q5oUR+4
 JyiDBHnrwEHFjMXtLdoW5y7JCZwSqwiZzEEQpJ48lIK5dGBuXpyAN/pIAwU7dO/fxOTU7ZAxKSz
 WveboXB2wZ8VKqCMmEA==
X-Proofpoint-ORIG-GUID: k58olFmwIw1lfNqgoRMG0oD99yXQL5bN
X-Authority-Analysis: v=2.4 cv=ebIwvrEH c=1 sm=1 tr=0 ts=69b7e670 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=fneQyfJuBaBqRE5tITMA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1011 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160086



On 3/6/2026 7:18 PM, Luca Weiss wrote:
> Add a node for the GX clock controller, which provides a power domain to
> consumers.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
> index e1a51d43943f..621f05820826 100644
> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
> @@ -1224,6 +1224,16 @@ lpass_ag_noc: interconnect@3c40000 {
>  			qcom,bcm-voters = <&apps_bcm_voter>;
>  		};
>  
> +		gxclkctl: clock-controller@3d64000 {
> +			compatible = "qcom,milos-gxclkctl";
> +			reg = <0x0 0x03d64000 0x0 0x6000>;
> +
> +			power-domains = <&rpmhpd RPMHPD_GFX>,
> +					<&gpucc GPU_CC_CX_GDSC>;
> +
> +			#power-domain-cells = <1>;
> +		};
> +


Reviewed-By: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Thanks,
Jagadeesh

>  		gpucc: clock-controller@3d90000 {
>  			compatible = "qcom,milos-gpucc";
>  			reg = <0x0 0x03d90000 0x0 0x9800>;
> 

