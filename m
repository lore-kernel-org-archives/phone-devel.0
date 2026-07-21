Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663B0233923
	for <phone-devel@vger.kernel.org>; Tue, 21 Jul 2026 12:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784637416; cv=none; b=L6L3ra2zoCC21eVcCZYbU1zfdjvx+NrboRW95FxRtYpEyrRwsPkoeh4apkzOknk+isaQW0XP+xphITwhFwRIasI8+8FzvCmZ9J9G6p+8wfP1Z+yNqYFjO+Ipw+9+94QtY3GQaxCSTvWlf9sncBU/vxY++vns8z89rhpUn1XFxhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784637416; c=relaxed/simple;
	bh=bhNmXrhFvaKTam+ofBz10yzIZUgw6ydcn1p9PpA7Mu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cGgFBkHa0rJN9bDjJPg1q4UbQDWQo7j1NdeeuawbXZw8VtftYZaKiRfN/y071dLnOT38nA5Tr3uWhOigV5SOkQHZeI4bmKypBwVCbLwySzgC1omuq2nneCxf9pcvBlkMzcudLpyo/w05ohpC/wiLxSxNnpCBSEvKwADry9rogRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eNsc/q7y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cSeQHb7L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eNsc/q7y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cSeQHb7L"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LAQqnH1611726
	for <phone-devel@vger.kernel.org>; Tue, 21 Jul 2026 12:36:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MVnqQ5mVLOQX3eA/++nkwkxnU4gvBABzd9RYvTIMudw=; b=eNsc/q7yNwt86RdA
	y2eZdPs1hu8WWYKl2UqpJSju4uefKJLbW37RZgJq+KnXQibBPcJ0fOvg68eXAr+I
	QLMsedQ4NV8u1fMZsRq9ZOm6/fepjVfdgTkvBhqYz1whho7VP39hhd5MW/VHaAEH
	Appjf0c0eDB09LMZvvICSi/RdqLUydnjN3huq9PBAlJ5Xqqy6hLeoE0TSn1M53mg
	i5Uhvairhd3t3/wNwSA7Yg6mds1vCJYBUEYc51t8GffhgeoqUSCSnqm+DqqPhT5g
	qjqg7OYygcl9zhqsflTC6805iPb5TMEBTIjCbvokguOdtbm9L7BkesaYDJ20eZIw
	ByC/VA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6r3gpgy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 21 Jul 2026 12:36:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1e777a15so23967961cf.2
        for <phone-devel@vger.kernel.org>; Tue, 21 Jul 2026 05:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784637414; x=1785242214; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MVnqQ5mVLOQX3eA/++nkwkxnU4gvBABzd9RYvTIMudw=;
        b=cSeQHb7LuwTwRX+uLy0QDGU3dnuOSWmLhQUjFTyCIa1HAchWAqQkTnoPYYX9b2+RsE
         hUDhIEWvvVANb2776zNu64Wa99hzJ9UiKV8a9PWaPWJpMHDoSMJlRJJadCr7J0qGb35d
         PGegogb8mCk4rckrJHHOoH8wJhmz7Pr9Pp+7Eb0bFg0sgDt0AlsNWch1qrFh1YM1jQDi
         IgetBNxJD82d6PUu5qCtLOrejscFQLqPFBWISK4SOuJTPnl2ml3Yi4d4a0fc2HbI0lyh
         ta4XbY4cd/pJSpPyp9jKbu+QQHhiyx40GKOdPpYuPtT0isMLvubdRuY00YZFWxYr+WcN
         mlLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784637414; x=1785242214;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MVnqQ5mVLOQX3eA/++nkwkxnU4gvBABzd9RYvTIMudw=;
        b=kLVvz5CK38RsMkjfizqMytD2toIPVkN5uFvSxiUxlJsiz2mfmBwUaT5CA08QNyQHzs
         3CVPcLQXvLQnEneu3vR6tU+jNIJGzbbHhedhEmIWiUPNr5T+cf49bU5HZySRFYfsAiYk
         0v4GUjzZoqXnUTpx5TTI9pvWLGM105u28b8w+xGS4u9LSxTMzusMWKmk5AhTXJE2LhPi
         WD+QdHJlcLIHpvDKQYrWkae8dHYc+iX3fBh9mzXJLmeNRZiIKZlbVQPleziPANdAnFuf
         m/5k3AgnqINq4ZMn55nblFz2bMKRi01b27pK6vLNxpCKeX7/JPQb3UPznlyn/nkJduHE
         Ptgg==
X-Forwarded-Encrypted: i=1; AHgh+RrULIvLmfBKWsTt2HMP5NJVgNjFhps/abbTtH+kNZYp5m7L/j2Tyw7Fq8rxhODSmNFy0cE7ipoTD2F0Cw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5foVppr2CBb+HoFTjObBRvHYzyu1lxJZoHzDcXPURxT1BJrkU
	wjIMnOEvCUl/xeaNdRPtDefa8GI5q3ubPCRD9dBTGQuPB6zHq1Mcoa0XECFG4omJycL8UmzU1+u
	pocUBsF+F4iLw9grWyJeoHLfRLWSIflnCeBFQDVhAG1FfOAqPP2eDQEMOgGTHbb4HKg==
X-Gm-Gg: AfdE7cnhBCi2WazkKs2UBuFBjHXJAvE5o3AP5ltnJBxoROysiiaxhvDdRNQR5XXztJE
	q1ewJmjpxgNUxUJ1T/OLLHa+MnMmhovx2nUlk4niqOoaEocWMZqcuSJCXazgHdt9ZSKiwojnpzS
	o3tj5xNtjWRbRmkjiPuxbIa+fhyvqj4BrjT6NdI0fVxgqLwP42gzmq8LYdLDuKZMUkG62zMPAEH
	q4x8p61IxPjbHEHLYAuALxS5l82Z92BltQED5NA/I1ymICPcuTczPnzSVCpjtyhJpSYCl9Netwx
	jqNTjyQuD1mNXplTOaT+Vtifx+eOj7m0RUo+p5L8HYs3Wg1BGTQ39kGoT6XxWD2rJhfOsCEYGEe
	ODy8kKobEYdiQOiAVO+DzxhEx
X-Received: by 2002:a05:622a:9dc:20b0:51c:223:3c57 with SMTP id d75a77b69052e-5213f375aedmr104331321cf.10.1784637413444;
        Tue, 21 Jul 2026 05:36:53 -0700 (PDT)
X-Received: by 2002:a05:622a:9dc:20b0:51c:223:3c57 with SMTP id d75a77b69052e-5213f375aedmr104331151cf.10.1784637413046;
        Tue, 21 Jul 2026 05:36:53 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705afecc3sm581269666b.24.2026.07.21.05.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 05:36:51 -0700 (PDT)
Message-ID: <a5d6f840-3849-464d-a540-634dc3ec81b7@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 14:36:49 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] arm64: dts: qcom: sdm845-google: Add dual front
 IMX355 cameras
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260721-pixel3-camera-v7-0-82d323c6c5d2@ixit.cz>
 <20260721-pixel3-camera-v7-1-82d323c6c5d2@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260721-pixel3-camera-v7-1-82d323c6c5d2@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEzNCBTYWx0ZWRfXxrT5Iil3vX45
 Lykef01KdeHc8Rv+V/lYMSKjBnU96+VbMq5s7stB7sm9DWn9zixjeZHrfoD6iNsti3oMGPZM2yi
 aUkow9TBlwCe0/hq/APVqgKFyzUmaHNoxn/CuRRZIZOes7vyLHUU2SHswOSqrrr1CvxbLCOsvUf
 8LlEawaFmdwPRfNQ87pcJ8gmrTcMwXIsNdwEQl18irc+pyXsdQnPkW626HS8RshseRBhGSOZN2G
 KGma1JuWZbO2PZkCW1Y++9KvRlrzC6Jw2xWjCwoukMMGkEL1r7GJYpR6Kgci4u5y10F8H+DeVNP
 c+2QJSgA/qnkz8fJfh0wtRgh3A6TY0Jx+5nPp10re0bmX9bjNLgjzwwkZ8Y6OvYGHCCy6rZTM+8
 7+sP4gMVrDEQTzb4I/BNd+9s5ZwU1ylRzjaceeWyV7djtzERnZS2D/cbkwyrstost44RhnpRTdh
 E650UFhO2Z/wIQktTQA==
X-Proofpoint-ORIG-GUID: XIYzrFcn4wQegXH5TQxc6ArjZP_B-81d
X-Proofpoint-GUID: XIYzrFcn4wQegXH5TQxc6ArjZP_B-81d
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEzNCBTYWx0ZWRfXyfJqZgx5Nzbu
 RLjrEFVjHC4qo1r+Qj2IuaZZDvZp2fsdNvemDY+c3LNlAKA4oEm3ln4cmrf3bwbcvkqjwpsxw3H
 R1oVCVHXjz66/HroeLkLo+qWktvazO0=
X-Authority-Analysis: v=2.4 cv=SIRykuvH c=1 sm=1 tr=0 ts=6a5f67e6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=5ZtbFIxHr3uJdDL8FOUA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210134

On 7/21/26 2:33 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The Pixel 3 features two front-facing Sony IMX355 sensors with
> different focal lengths (standard and wide-angle).
> 
> Sensors are connected via CSIPHY port 1 and 2 and controlled over CCI
> I2C1, using MCLK2 as the clock source.
> 
> This enables support for the dual front camera configuration.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 172 ++++++++++++++++++++-
>  1 file changed, 171 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> index 9368fd6b87515..c8a28133fb38d 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> @@ -1,16 +1,18 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  
>  /dts-v1/;
>  
>  #include <dt-bindings/arm/qcom,ids.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
>  #include <dt-bindings/input/linux-event-codes.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/media/video-interfaces.h>
> +#include <dt-bindings/media/video-interface-devices.h>

These should be flipped to be sorted.. if you smile very nicely,
Bjorn could prob fix it up

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
