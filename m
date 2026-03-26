Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A43A36CE1C
	for <phone-devel@vger.kernel.org>; Thu, 26 Mar 2026 09:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774517396; cv=none; b=KhVqiG3S05TYed05jbBRASk5aphvXmba4O6qSqTlrIvIn7uIirAL2wK95oLK9wA/kwnSoTLZhfMYFefcxzgnhVYlQDbcPlH1DZiHgpsmWjBGAxYcayLtQ43eCa0S2AfARt+5tyoiShVEVbG6MJmfAf5G0fNbX+Q2nH2MsNCTkH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774517396; c=relaxed/simple;
	bh=OEtA4jyMZvL9PeaZrYIy2+s4yVitbGhdxbY2yo6rOmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DfiRbJYedEr/ukKpXTzCbIclPeEI3wx2CYFnPIfSolZMln6xOZ8YC8eXwh4u2H6XCabDBtjDENnzx7kX726Id9zKIPzjqCuY/rzY/F25zi2/Der0fNzomxUZgSPIm0nvcvx/tBfYao+S7uD6wT/ctTK6ClTrS3iaBYcO+1sDmLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jeudyJRk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gIgU0J0z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jeudyJRk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gIgU0J0z"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q84usp1811317
	for <phone-devel@vger.kernel.org>; Thu, 26 Mar 2026 09:29:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1gH/nLTW30l1t1AMZDWjlv2ErkD37N2Jw351X4LtQoc=; b=jeudyJRkSOQY19x2
	scimtqrtUx79HPyLXNhLQaaP5m93jInrdrxg300dv0at+Og6AeKLaDOWe64O/WXA
	6uJER2RJkChjIRxTHyN8t5D7xgagPTBW4JpeA8Xvfc/qaHUeiNcXqd4jyeZ8tRoW
	eHS7E4hKgFUCXVAjZoO66sZRwu2zjZ9RuJ0F8YAZiY2kXMsz1MlzyTurBkOcVkHo
	yfXxLmRzweQiOyyz4nkTmIMg+27ej6Bx62ku8sFQ3ECnLFjXrCt2oDIgc3UkEKHP
	WQzp+tUGABYHDxAlNWxab/9eVMHEtPFbArsUHsKB5BDgZWfisC7d67h0EO/l/EKd
	wg5jQQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4tkn1k2c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 26 Mar 2026 09:29:54 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89a5b38affdso2505986d6.0
        for <phone-devel@vger.kernel.org>; Thu, 26 Mar 2026 02:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774517394; x=1775122194; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1gH/nLTW30l1t1AMZDWjlv2ErkD37N2Jw351X4LtQoc=;
        b=gIgU0J0zNR8mLHe8JNAtkGsNBsap+jIFS1d8u0Lijg94X/h6qtmb/Be8OH7bOi+jHV
         kSfDKZ2XDeMDrFYazVR5ueK8oSLWgDxCD8tQIPai5s4I9dRld6Usmfu/RZg3qjXy/6yq
         B0jjXjk1hoXDq6BDKpRLdsHbjGLlgfcb3+iwaRXfnvaqHkr7C1FVZaIukb8b0YjmoEtD
         NdgPPq9KwUZA19iF+SXPUblhost9f76kbU7+3BBxihNdsAH6q4IGPTiPdT+5TNXwU7zN
         Vrtbq749jUzB7WmXeTuRSU/VWLaJW9HgzuFz/RGo6qAq/9r8SX/r2DTKvQ3osZmXwYjZ
         pjxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774517394; x=1775122194;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1gH/nLTW30l1t1AMZDWjlv2ErkD37N2Jw351X4LtQoc=;
        b=dnVObltdcW3rsltYlQwA14yi00yNjPV+F6H+GkzQs8lCQcZAcoZHoCM5dETgHKr0Sg
         QRRSIcDLcLZvkcu4TFvdSOAOIKfbEVveepzOK1UtWWBIdr26nv8myCyvfG77e71ggNAA
         9RoPCr0AWzCBRqvxKzg9eEyrw2QnyZUhXl/PLheP42RgWETAU/6k5mx5uq+PDPxoec5p
         +Ru3eBOC2zBtYUb9xwMtoyoW40SWhTmTYzCgFF013qPWodBYGsSs31FyVcN4NPg8tq8I
         J/Fpe69Spo+ASTa8RVlHfZDd8V+Xjt4yUNziMO7w42GuvRmjuJcwdMaF5B9ZY5QXOPVK
         cbAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAVDvYGTQpZfD3bM1tncd91nQEosLGQKGvXYnzVPxQgY9xJOMCS47uggn1lEEMR7Twq1thCLRflxhfTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdhIo5bDSramGVr6LG5kNg4Cid985WrqN5fMCkNqdqTilNd4VZ
	MHSM2YEMbk2SIViERNK4H4623GjSF716OnuH18HxUBKKKpR2RaT52sqZJsxuSpBVnS8ZVN/OSB0
	Jg8OVZXzfKqhg51d0gMgFWa2BaJQXtwV6jnLEK0QO8xVTEp3Kd2WL93LOI4X2kR2VTQ==
X-Gm-Gg: ATEYQzyJh32Tj2TuddMJIk1Ll/pnCdN+YuHc+vr6xMc4sq5hD23l8GLYDuWGS+wAnlz
	liN/yDGzOmpQDs2vZuNsKJbeZHsi1JAbLQv8F0utqwaAWGHlX4Wj0gXJ2GALY693SDFhM1uRqrb
	2L4jBsuR7gqB9kPie3srjTtkCisrhGiAIv0yKRQch5qMj6nEQoiACloF+pNWBAzu+mCHKDD6frZ
	Bry+PUKlL6JqnZtBpis3xV7mpxbEnJUduEFMRJJqhVELLC00Wn0NoQzSj9LnKheSIDU6UvQVkk+
	eUwNy3a2knsBvFcqV0eytehL4Lol5P960LZsvGeQcwP9McR2n7IgE8/2+KWk2Qfwx2O60CG+VBu
	X10UmMY4STXYb79ej49ecpqajrZbK4YYm+FY6kl6xI9H/0/yQmz2mVBfjmffFud+iv0g6qmoLwg
	zxWfE=
X-Received: by 2002:a05:622a:848f:b0:50b:5075:5256 with SMTP id d75a77b69052e-50b80f42a88mr55691471cf.9.1774517393518;
        Thu, 26 Mar 2026 02:29:53 -0700 (PDT)
X-Received: by 2002:a05:622a:848f:b0:50b:5075:5256 with SMTP id d75a77b69052e-50b80f42a88mr55691281cf.9.1774517393028;
        Thu, 26 Mar 2026 02:29:53 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b203ef86csm92027866b.49.2026.03.26.02.29.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:29:52 -0700 (PDT)
Message-ID: <dd71e35d-5dd1-4341-bcdb-d082dba41d3a@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 10:29:49 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR
 transmitter
To: Biswapriyo Nath <nathbappai@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <20260325-ginkgo-add-usb-ir-vib-v1-5-446c6e865ad6@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-5-446c6e865ad6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2OCBTYWx0ZWRfX1GZJqjSPb784
 zNsUBI7OatNPBzFYCG2PvdlLs+ClQcEs0jtbP4mGY9KroUTuWrp1IyTboVu3SJgYdta1UaI89CQ
 kN8cDg5SVdFlouZb3EfJgzeboEd8R6E/z+CBAmiSjVjZe5UYrL5yEvb5gyYCWZEl3vq7aWcqcP2
 qVtxktsgLpYPtF+4/puKxyGxrFhxbcMqxX9Ci72DprKUA4+I8giYFcWwNYgfOnA0fPYYaE5YIZS
 MZYQU1M416C8c48YW4+fMqi0jRLE0ggw2l4Yj3SO6UfU2BK04Cetx2e6w/FfJNgzPQFfXQpg6wN
 pA9yrJ+8BmMizHqhiuDzYumthIH2SeemahlpjUFD9DNTRrY093IMb8o/7OnsOOVLkmt3v9U0oC6
 DPDB+9y3QT6fq55PkS2xaIt+sMwBLqHtjZbeOseoR2A0bg+JKHurPNljjs4VX89WYXvahoL3b6U
 5mPwlPPt23H+Qo8udMQ==
X-Authority-Analysis: v=2.4 cv=It8Tsb/g c=1 sm=1 tr=0 ts=69c4fc92 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=RfqWXZ9bYgCeT7nH-EAA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: L8CYogYF4Zj7F5QaVeBhc32IVpu96ihl
X-Proofpoint-ORIG-GUID: L8CYogYF4Zj7F5QaVeBhc32IVpu96ihl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603260068

On 3/25/26 7:07 PM, Biswapriyo Nath wrote:
> The IR transmitting LED is connected to SPI8 controller.
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---

[...]

> +&spi8 {
> +	status = "okay";
> +
> +	irled@1 {
> +		compatible = "ir-spi-led";
> +		reg = <1>;
> +
> +		duty-cycle = /bits/ 8 <30>;
> +		spi-max-frequency = <1000000>;

I see the binding allows a power-supply handle - do you need one?

Konrad
