Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481732;
	b=p8zbcSMLEAXLwV2Yo9ne4giIz2J9Js1wM0dk3dIJQjE+BQjcwNHhYanOWQVlm0js9VHJ
	 qPVvNvnHb3sDc0ahBOO5/BlZFzgUPTuzfnMI2DsxMQIRjs/7oQv2XjMBANDZTFJ/eKYkZ
	 6k1gMfqVBY8DeFlVm4h2c5Xu1xk8AjPTVcEN4ZHCm81mg/QnJzlnJSQhIcGWfmsMuYCVp
	 EzlMPD4uA408JxEVeyjrgTDzha7FkYbNyEsgTzpL+8ETkL2ZFGHm6I48oYxOa6fqNmWZD
	 5PUiVQkJLTSxl5/L9U1EFmgHBObqKYIXW38uNhEz5Ifd1APWHpZ6LhlCDApGc5vVIBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481732;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DZRPJySHmg1AbHi/1VKM5kCKJJzzQaHn48CduryjPiU=;
	b=SxP8bH3bqiP3PQuGUrvJ8wVCT5ary9/Jseu4YK5OT5EMTlQ5Ssn+9+CWM9mtTXsbHZ9N
	 D4ysgFcrO/PSKp0OubmxCCs6P45T+y7DITDtgG7Lg9KdNpn4cMk0IWo7a3fEtVy679bpJ
	 LdfLzaOEPwBpqtth6E6hAbhCICqNv2Tos/R3/rO3UV/j9bno/4Zja0dnyXdbF2HQep+kw
	 v2A2szjFGIS+wkqqMLn7iJztfkppDZ7fYtrpUoFbGr20ESP9WAsGujQh3QSsCgSy2kNfN
	 hhnxpgtp8Pms7h9kRaFNd56TN9e8ivPjarC82Vj3ibmMz/Nx2D8Q1xGguF7nbsk60TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nlRDOa8t;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ei9vJL0U;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93ECB606A31B
	for <phone-devel@vger.kernel.org>; Tue, 20 Oct 2026 07:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93ECB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nlRDOa8t;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ei9vJL0U
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tCow3485875
	for <phone-devel@vger.kernel.org>; Tue, 20 Oct 2026 07:35:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DZRPJySHmg1AbHi/1VKM5kCKJJzzQaHn48CduryjPiU=; b=nlRDOa8t9Hgr9vm8
	Exp0+O4d+Xq/xMzvPrNn5DYCcsjtKzuLCyw20nRs4FePtAY6GbdMW7zyWxPDL6bA
	19+GeiCCMFgoBnkaw3ePKddjvKYbPqPNXbu8ei0HeNVbwvIi1SO+PETvFZQFjxNQ
	90t9Z0t4j496eyQ5YcbChZ2d8i6fEGd5Jz0onMYlMQssopqHIIzOzde02sfCmQlV
	WmvmbtI42ccAuZLXFPFdj/VNRrIWZtmgYr2is7Q4x+lxqCfA2qu/swuxyGatNtmN
	iqXiRQr1EpvjbRrSbglaH8GdJEzxYHGMU4zEbCcEGENoFD62C48b7mC0nNqgBUUW
	PZKQKg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n1dhq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 20 Oct 2026 07:35:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53630cded29so10537031cf.2
        for <phone-devel@vger.kernel.org>; Tue, 20 Oct 2026 00:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792481725; x=1793086525; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DZRPJySHmg1AbHi/1VKM5kCKJJzzQaHn48CduryjPiU=;
        b=Ei9vJL0UREV7NGiEWAy621xe2iRZsXLBXEYe7SecTLIEn2yDIEByo1qPpaJDRcGbRd
         wPCL7tuO+kW335EZsEPFKXzjff4Ba3dtEGrIQj6r8gTNpHhvq6TtleO326jytYjFf/wx
         e31Jh2fi1VYQ9m8v42svVjW/nxoXywX0sxsyQaLIgM1Xyqc5KnpjBnYKwWX19arZlWnz
         cO9ZCIv+h6r07/DYq0MU+L8Y5Jmzm+l0hbxmHaCJDxK1/abFvQkT2mYGVFeh+CHDYIns
         jMfWGkQEPBi/KWpETWFaMN3A6kr3FX1PC9UGxkhHG8lyedZbyk+fIdF7CbalP52afOJ2
         KjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481725; x=1793086525;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DZRPJySHmg1AbHi/1VKM5kCKJJzzQaHn48CduryjPiU=;
        b=T9J5Rm2amxfN4EwpKa4JZ49wdA2zAahwvEqXlIIDeEWpGAYkslJuHoL8+i84pJMzu8
         R/b+OIgxLmeXuCqLRDHG7fJrRdmiboEySowDipbmxQXo13mHsHX+slI4/KeGq1X/goJM
         n2a+bhJS/SuVKRvLRb7GfuZO6nkb9NH1fe4TVXKph+1Y4qpZC4+mqNYoIvJDVeFB8hSP
         JLEThMGwhqQdItDNc+s3+Qn9UgftqwAYBVaiFF4LHOhMS4hwQIz1PEHItVRHYCdE5FHO
         X3V1mU4DYM7l0wanQIcaKSVkSbNdy5BgfMveI+cSTaWB8RtjESweWonr3VEUUT22ESuN
         UdEw==
X-Forwarded-Encrypted: i=1; AKwUvBwKgngoZhbokqbZIFV05WHXbk8fo3G4gG/MMZ6LdTvOjaTNrNREnY83DTm9vf+L9Ml489Js+MPxKlVVkQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYL7Ba9Ha8T1CiyoZ4t9KlDjLDCxefi4cFklgI0SaAfGVfqybJiC
	V5+v/FafB8I5vtJcqqIOxTGAEzaXR9/yGF/4lVKBPu6kC+jJ7Cawcwo//3cQGiyYgClcHul7pvX
	4hQ7ES/QUF+HyGs/SmsSnSlSUnDHY55A3+MLIBcYlOIE3ZqJJ8uWcPOgnALNcmrHNSQ==
X-Gm-Gg: AYBFou2GMYL1OMvMEPHl4b58YTL/ZhaMuxww0kGrRnQMYD7uo6bmTm6yHIWIB0+q4Ka
	EkW4Zj9hR3MWM0CkFCZ0sTX0E6RGNfFL/8F6sn/stcaI+3Mqzdw2XgB3z4OROefzzytD5WAS9db
	1+bpV8Zx4yPJxVjA4IziVMFQQW/NwvVJRc/PCwfxbN3LtBqJUQwtpMULkdo1NY6ZZIbXPSszx0f
	OYOu3Y3vVJ3RqdOQpHDjb2UCmZzQvtJPUoiztGyVpiTHCHwo9LBDOefSwUBYc6NKZJfKuE4Vsyg
	z1jHpSeaSRxbAYmygk2wv3bIATCMwKF7b4YtjAwoqlaB6u1t8pgt46jJW2y5b2aC3m5XkOXADce
	91//9Ql3MiBSWM4+RaIgRxA==
X-Received: by 2002:a05:622a:14cb:b0:51c:2324:666 with SMTP id d75a77b69052e-536460e29afmr170738161cf.3.1792481724810;
        Tue, 20 Oct 2026 00:35:24 -0700 (PDT)
X-Received: by 2002:a05:622a:14cb:b0:51c:2324:666 with SMTP id d75a77b69052e-536460e29afmr170737751cf.3.1792481724319;
        Tue, 20 Oct 2026 00:35:24 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb14a7sm471411166b.76.2026.10.20.00.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:35:23 -0700 (PDT)
Message-ID: <a69738f1-1c6a-4476-9c0c-8443650d1f6a@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:35:19 +0200
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Samsung Galaxy Book2 Go
To: Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Jasper Korten <jja2000@gmail.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Luca Weiss <luca@lucaweiss.eu>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
References: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
 <20261012-book2go-v1-3-7188e7ea7a15@fairphone.com>
 <fb634f17-de56-4f43-b139-3d040a35f019@oss.qualcomm.com>
 <DM3MSNLF42BV.1UV490PXB0C07@fairphone.com>
 <emdm463llmoi6vsv3zmfjddqrfaf2iubdnydsqye2n6ui56oae@frsvj6el3zvq>
 <DM4DIJZOLJC0.2KAZET8VYUDY0@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DM4DIJZOLJC0.2KAZET8VYUDY0@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aIplOr9m c=1 sm=1 tr=0 ts=6ad719bd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=b7wq30jk4QowdIX3xroA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX8JLX7W4S+624
 R3oF1CEgYuuvi5hUpn9GhLG9dZOKPxHCzphVrpQXlxqSnHM6ZDz9hb5xZHBrH2EjKXnXtN0KgBA
 cJTn1prD9rzw29yRM/mSsbw/woRTrVk=
X-Proofpoint-GUID: CBoxgrXlIXYkGpCJMfTtwHbLe3gjYIl2
X-Proofpoint-ORIG-GUID: CBoxgrXlIXYkGpCJMfTtwHbLe3gjYIl2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX8nCSSMuYcPnO
 JCUplevgPGOHtPqkzw7XT/+lJWbag48RlFiphWgFXdJlqbZ4J32NL/f6729hZEj12C/zZV3Z+QK
 fK8tbiTlGDwQFkmoSrCSWEBR2OrWmVmdLaqK8XUYvPhy+qWhasZRQmogLq9056SItTYMr3lu4F+
 fm6zPhqiemP4hKXzFnNe9IuoLyG410pobATslK7lsIT1Waaj/f3KlSWgSNRcCwmftAt6wiPkmL+
 8Gya6hLM8Dq++RjfWZmpXoq+g/MU4socJ24nDDdm4EhVYMrV3UMS5uPwvOki4pU8zR+PFuRrxrp
 ijz0wXTlXcDeXjpcjsy3Pu8z3l/bAWdzR3yoSwPHQ77R1SiefHF+QDdwuQIyS7pyijQIWiWb6HW
 AsBTrMHERy2bPNRg8d7H3UQXieXSBvbF6Lr6ESE+pz1FTH1SpjI12rsGo13VTBhU38UrRf0ZAB6
 7cBg5sXCBkGeCiPtCuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200030

On 10/14/26 9:13 AM, Luca Weiss wrote:
> On Wed Oct 14, 2026 at 3:28 AM CEST, Dmitry Baryshkov wrote:
>> On Tue, Oct 13, 2026 at 12:17:05PM +0200, Luca Weiss wrote:
>>> On Tue Oct 13, 2026 at 12:10 PM CEST, Konrad Dybcio wrote:
>>>> On 10/12/26 8:11 PM, Luca Weiss wrote:
>>>>> From: Jasper Korten <jja2000@gmail.com>

[...]


>>>> I'm assuming there's no pmic-glink on this device?
>>>
>>> I'm not quite sure yet how the USB stuff works. For sure from
>>> observation, USB-C only works when stuff was plugged-in at boot time
>>> (UEFI?), and charger also only supplies any power (but not actually
>>> charging) when plugged in at boot time.
>>
>> This means that something is not 100% correct, for example, missing EC
>> support.
> 
> For sure some bits are missing. This laptop doesn't have an EC per-se,
> it's got a "EMEC" - Emulated EC, where on Windows there's just a bunch
> of drivers handling EC-like functionality.
> 
> So e.g. already for battery, we just talk with the sbs-battery directly.
> I assume this will be the case for the other components on this laptop
> as well.

I guess sweeping the i2c busses would be a good start. The other day
we got a contribution for a SM8550-based Samsung tablet which also
didn't have pmic-glink, but used a SM5714 IC instead:

https://lore.kernel.org/linux-arm-msm/f7ba4d5a-0e8c-417d-a1fd-5b5e392df71a@dxdmail.cc/

Konrad
