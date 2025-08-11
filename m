Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43E32D3723
	for <phone-devel@vger.kernel.org>; Mon, 11 Aug 2025 11:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754911644; cv=none; b=ojlMn9FyNylnp9nua2mrbnA6U2YOOoDOaG+nzM70TAkCGZDa8q66B0nk+OLK+zJ5w3v17SydeA+iFrU1WhFsuvoHDbRmO2PKN/NWmofstxXfcSVhLKlchXgIMQut+n8NLAxy2ZsEoHDHGu8HTBzHWXhjAuhSaFG7nPbXX41m6OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754911644; c=relaxed/simple;
	bh=sNmlSmfYdwXOQBv0vavVqJDC1VXG+HeHq0jxT4H3q1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T9JFVO08hEJ6yfMH3zPAKgqDRcnKDztYqSQMJryjpj49fZzgZPXMhdeYCMUNJGe1K/QWTGd5ndYzvuIL4EHJQEO+EvAMBiQUsBlkMN5Ior6lKZWhMCgdkjws/PmhhsGxxoUxtPINGTm4yMkgekDA01VNZ/j5kl0M6XWIdicZTQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H7u9EUKJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H7u9EUKJ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dArX025361
	for <phone-devel@vger.kernel.org>; Mon, 11 Aug 2025 11:27:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MXqAgcvzQUdwo9xEC5/EH2pfW8vHuMbHVvogbxJ9Lj4=; b=H7u9EUKJwtYhg/sN
	aChKtQBcmW1gHZ8YY7jeKtOsVpXIZOeENSn32QgfNjnOsV+nj8R2Jm6uleJcYt5K
	/jXQxIxszap0mQZObpyO0bn09Vxon9SZjyl5swci6+9NycbM6RhepiJSBztuXMVY
	zQmeAgmw2yu9MraVMg8aVynIQ9AdDFRmcQbEfkIpiY1EesOlIe2k4Npc+4o+Cf8F
	tP4xUS0reB0VQfo+r9dsPCTUL6vnSHBZdXActXtoijk5kmOtnsDEXoOm3r4j/MWk
	yGMNGye6M5+UK3T3jyI4jy9ImEn6z/ekIIC8KqO4lpY30ME4QbwY+/NsItU/sA1D
	I8mxHA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dwb748jw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 11 Aug 2025 11:27:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b0938f0dabso11615031cf.1
        for <phone-devel@vger.kernel.org>; Mon, 11 Aug 2025 04:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754911641; x=1755516441;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MXqAgcvzQUdwo9xEC5/EH2pfW8vHuMbHVvogbxJ9Lj4=;
        b=U8vwRS16zAj5YzJY8ig9gsYMZQw7EwRO30CCDOZxkyBUV8ff3wUy90KvfFzyxZm8Ff
         3vv7Z+M7zt7tmj886Agda8NbA4xjYSU8UE0Zouer+qaXvsOMc9vIbXLbRRcrAYKzxr+T
         P0u7IeO0l4iXpAhq1Wxaedy2vUOs8t+0djTwyU2CmFuZ8uNf4rNN5qgFgYDiF7umcTYG
         fugtJtcPjQ32BFMLbOf7LuRX/8fs/hAvior8jmulHSM5oq14qja9Jhb+/xGZALIXTTKj
         ZnrC7UvYfzolFYCGgoA2eGgNyFo22TAWyxnDdJsJqh683e1rpxM0gW4Ez5tJ0OLnk4T/
         VmIg==
X-Forwarded-Encrypted: i=1; AJvYcCX6cunrMahQYpRcAJMkxHCTVPXP9v1p5DjiOz04aaJEy0N49jT8upbWZ+6TFdSi9b7YG9i9mOTbEo/C3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCOVUQFk35jIV0g22KF8VVfbTgStxeldsBnJ9dB11ESFl7OaUk
	5Xout6PX2fbJA3m5JwmZxSohfXVwa+KeJ73gZBUeDlEcYv7ygpMCdIxPeiiWJCrgxe6Tts+M3Xg
	l5w33DI3StTpI+ZH/0gtshQzcE3p5SlIoIMaqZUqSiPLcdhZa/UIcGc7HsHvCVpaC1g==
X-Gm-Gg: ASbGncuo6P3gE7XMdubof4my7QtQoDcqSvgxjxuhMwcg4lqF88StzSZcNwJNmnNYx9v
	4RJTF40WtsbXCksHfnaZkBySqypJMSBOzWUiiDtdY7dfsh7qeZ/Ldc2leloocr0VU50nry8B0cV
	H/eWZk1qEmG13H0rBicocJucIZx1wPYaXJatACpFPUZoSYH/vpPEwoYjCWer/0N9CEyuX4h5zjT
	/LrN0QvPj9yIOKdlbluHNgAaQLI/33d7RuCCBtBTjqeOdE7ItpapKiYWEc2806OvQP2xT3uq2sn
	WgyLbGB4gYvmzp/jw9hr7xHzplRI1pM911IE1atV9MQEJNlNckMGiAnUm6jO9PCmjiKoDk5PPsi
	WzPti514ylLa2iNY1zQ==
X-Received: by 2002:ac8:7f83:0:b0:4b0:af21:80b2 with SMTP id d75a77b69052e-4b0c16c4306mr56045011cf.0.1754911640519;
        Mon, 11 Aug 2025 04:27:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFB82t9+WSwhTTLvNNNhL8Jg4BkUYV42aaK9LLPylVt42U1QY8YH8fULVeSO7VZVHjKz4kfTQ==
X-Received: by 2002:ac8:7f83:0:b0:4b0:af21:80b2 with SMTP id d75a77b69052e-4b0c16c4306mr56044781cf.0.1754911640094;
        Mon, 11 Aug 2025 04:27:20 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af919e96050sm1997444166b.0.2025.08.11.04.27.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 04:27:19 -0700 (PDT)
Message-ID: <c7be65ca-58ed-4a57-9294-8022927a15ca@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 13:27:16 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: qcom: sdm632-fairphone-fp3: Add camera
 fixed regulators
To: Luca Weiss <luca@lucaweiss.eu>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250810-msm8953-cci-v1-0-e83f104cabfc@lucaweiss.eu>
 <20250810-msm8953-cci-v1-6-e83f104cabfc@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-msm8953-cci-v1-6-e83f104cabfc@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=K6oiHzWI c=1 sm=1 tr=0 ts=6899d399 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=dlmhaOwlAAAA:8 a=EUspDBNiAAAA:8
 a=M0Bv5317UiM6gxb-jmQA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-GUID: qdvBKeX5wd18BYVXeNOkSHmsgXeD7aPL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxMyBTYWx0ZWRfX1ucfeBCq55cG
 sgKU6B5Ydy/TqZenN49EfZIihLMGgLr5XpykLBbvXAHGkW9pZxjDJMSPVXWqn7QY/WIJRKhrJAX
 iqAXJfo5OAHBICBOWH5dSr3ZwhIr5M1+xAQ7KIqWqZnhTBbGAGIoAaMtwyW+U9gt2Ljlhq2rKjY
 GHGKrXQNRIWdQP+jEF2Wj5yZ/NMu7gdt42xIbJXVXxZkhD0Mjm4oCcm6/UWeTaIlAQrFxs7L6Tk
 jIFhx2Eu/vwB43se001sti+xgyTHqsERqX25XKMJ36LTIYht0kB9ukRyZrf9Y+bYQ6p85KjA/Bx
 DnAzYoqZrI/AzVbXj23Lav4ynZQrWYHPmqDW7fUyznZ7amO61ILFrvk9ng0s1C+TDuDCba6GsMr
 6AZ5vV9Z
X-Proofpoint-ORIG-GUID: qdvBKeX5wd18BYVXeNOkSHmsgXeD7aPL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090013

On 8/10/25 5:37 PM, Luca Weiss wrote:
> Add the definitions for a few fixed regulators found on the Fairphone 3.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
