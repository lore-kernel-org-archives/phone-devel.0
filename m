Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29953939C1
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 12:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773663075; cv=none; b=OWVP8OylSiH6EUsaCHuSElQk+K+8Ugb/pFiZXMhl0ttHXrme8CkLAnrVfiWg+VwL+IN7hlKUvhOE2I0S4hNNi8T1wv23OMWpNmcLDwAHOUPzTNJjpbliIQ+1uBu7M9Bo+OAuFDDjgNAqOAOUCoYrLg5Z8SUFJK9PRhOmabVFPfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773663075; c=relaxed/simple;
	bh=NxXY0d72SkiS6Oc7GTCFcEEab/BJYGpDRewiFAEVVwA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=refPtyIAeePN5fSm7JcyIb2oygH1qCa1VDhMhmMMDLgBlNthXXhN2dCBKXLoEYYy13vAR2Oiedl8ydynlqa7OeGrwAcDn+MwHxPylOHaubUqYxirivnzsSnhBXo6OlC8MmdKaI0LgOkV/Cw9UpA63IPlYKlPkHOsThJVmBAqNi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KM9DwDOG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TpmY4T22; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KM9DwDOG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TpmY4T22"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GBhRPL745332
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 12:11:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uVnFLxY02QmTpqpWBL16NUJ30Td9Q2ohUeIU1Y182Lc=; b=KM9DwDOGvr4A6p0+
	er3+5s+85N3XkGRWcK4d6FmwfxNhIf+CZVEHGy0FPF0+IZqg5bzeU7DGXK9xzE4B
	LQCy03Sg7Ejp36j5jaBn6mst0UNWyjhB1jHcSnl22kBE4f8PqdGsH5C6tBTdXLXS
	dGWaCW3gRJ8bop76kgHAuhDdfnXc6yimX8vlozMysPl6HV6EnPgE0goC9zBHHdXg
	b0DVLqqgIG/mZQj3ZtdpZ1zIrU3lzTRzxj9kLnA7HnKpevm/zpf46/5AOfw4e0i4
	GLoR1eGaNXPLuDTxLh6kffWM+NY5+0wjWHbB11dRVF+KaN2H6F0i/CkrT5M3eF3R
	azxbfg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw00bdrnk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 12:11:13 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89c4cde1f02so10132686d6.1
        for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 05:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773663073; x=1774267873; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uVnFLxY02QmTpqpWBL16NUJ30Td9Q2ohUeIU1Y182Lc=;
        b=TpmY4T22WApQrnmfUmwmI+AIjOCL1Q41FXGGVIYJl2CG/ryZHuHyYpcrwsQ4mlwKqO
         Qqr7OqFlXjgAHH/7Lv1n4zcPpbwWQtsWP4CH/fBOKiNWpBTwB2ogb5tW65VfJ5HwcsOK
         XiOeyNQtorHPCzUwAYl1AEDDnWlOuFSgQ2DwE+x7vP8MwF2W1i6WiWd2ctSupT4DrItj
         fqmi8xg02FEukDcUfJ7lk2MZrN70U23zp9qcm3qOZEZ+sgQv9YunAnFOlvYv3jbOYJO/
         WB9in25KJWRi5VcyffJKx054/EzTUZ622aHfMyfqj8MSfwZa8t5FBb94bmxG//VbQdqD
         kNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773663073; x=1774267873;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uVnFLxY02QmTpqpWBL16NUJ30Td9Q2ohUeIU1Y182Lc=;
        b=kMRx2BooZPfY1Hh3bdSrBK1O6QatwVNMGJvsjKJBl8lYNHwvzzq/qApmFr2EwbRU8C
         Ht3X3dFAWInyYxS2kkKu81zPqomOELHKhVffLegxWh7+6z4rXLQtbQ4kCZE4W3pYiNge
         uU6opudXt1aDMAPWMx0Y5lt0qNsW//OKv1tshDEwaCDotQAQFMd89OM+K13t9AmDX7uC
         Q8acGlXxNgBA5gIOY7Nz5rlCt9IepkswXqdkjiP2y/d7TSCdX+/LC0WmLAoW3jsCSB/Q
         8Cl8kUH0/cIEhR6nhCHGT1MeZuB/6u2ZROC8/fzY9AmFmUHnrySdS4NvHs0gWeIBCSbw
         M/Zg==
X-Forwarded-Encrypted: i=1; AJvYcCXD6C9RhZTnUmD8+HykWUH9H3s9sz8mRzFZZIuXIYIRE8Y99ac9/F3HJnlsuv/DvPnmquChZX+uJwWWfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YypmreesLam+QTs7PB6irwKbN3ynYeIQmhOCtiqwzL9Ib8ncfm8
	yOZ8ESKzMwcspMKVPpJDm4GSo2YyclITlvURb/G/RUTXlsZYvG6EXgsnXE2JTHaV0DVQ5zyilB3
	85P78P9nPgFNXzRStqWJ/kIL+pq4c1sT6cGzFFI/g3XhZXfOGv05v8ASrvI2cusM1CQ==
X-Gm-Gg: ATEYQzzI/j03wC/fwY3UYbM20+OpM+9mmIgcMYq044RW68LBRGgm/kCuFhkPmcGHoIg
	Fk21S/Q/Z8fOAdNc4Eh0U+wXKf2ncb7/d0HWNH3CXXUbRW2BDNN9CAHu4yfWgAbEsZwtI+cAx+f
	nuLk5xRdAiL3f21fBNtihmkIFPYvijtR0QrUdi0HJFmq+Y2ixkO0Bo/BvYjk5fVJOazzk2u3Mzj
	EMReKEHtyV6iI92Ph2IYvFB3Hvi/UWh0GRvAIqBSQ5BygRDEU15QInnRiPhhnFzW2TywGb8fj+C
	Cxywqk9tnMvTeTYCTbogjLIUCtTk505AAD/B0JBh4C2XklDkAf+HV5Hnk32qVqeZCo47eAhMWsw
	/qhiJsanHe7DIqlazHgvLjpZQEStW1pVQ6e7BuJt0N1yEeemiI3qf1QSaeA5M1rIPbsH8YetfhV
	J5WCI=
X-Received: by 2002:a05:6214:2b88:b0:89c:5135:e369 with SMTP id 6a1803df08f44-89c5135e71fmr36740046d6.3.1773663072990;
        Mon, 16 Mar 2026 05:11:12 -0700 (PDT)
X-Received: by 2002:a05:6214:2b88:b0:89c:5135:e369 with SMTP id 6a1803df08f44-89c5135e71fmr36739586d6.3.1773663072538;
        Mon, 16 Mar 2026 05:11:12 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b978580dbbcsm475135566b.38.2026.03.16.05.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 05:11:11 -0700 (PDT)
Message-ID: <ffac14ca-0220-4fa4-ad55-a3acd354a22b@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 13:11:09 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: msm8916-wiko-chuppito: add
 initial devicetree
To: adamp@posteo.de, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260311-wiko-chuppito-v5-0-0a8656cca1b3@posteo.de>
 <20260311-wiko-chuppito-v5-3-0a8656cca1b3@posteo.de>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260311-wiko-chuppito-v5-3-0a8656cca1b3@posteo.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IsATsb/g c=1 sm=1 tr=0 ts=69b7f361 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=CvpffSWD5qBmFRTzRFsA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA5MyBTYWx0ZWRfXwSs8l552W4WL
 pk0sTiz7MkPC0emwkaeyXleOhVc6S78xKT5q8rlDMCMlhwaby5KetaIhNtX84IfpIK+peivrX/R
 oafbahow2leS05Vtpyn3Q7RcUjodCIDNBetcXdU1Q1EaDH3PaiIOsrwXoUqG41zx+l08T2pTmHN
 H72l71+3BQrYOIDM7Bncgp05T5xO//dcznoRNqGIDkcQcyaOd2XfkMWyB8/TjaMcmYZLsO0i+0f
 792r4xFrK7cvXGPJ+PFyL0/e3HFOLnfDEZDfcU0kUSKFX0kR0eQinXd/RzmSbG6CI1BUptL0dkn
 rxLxuTGOfjsHyJxMbTPySpSkjer99wJ9Y7Naq09BfnvELtwZM08aIasYd+tm0un7h7gsKmWPWSY
 O5ZeqfSax2LNCgZANtuZFmam6e9aFBM2JxBze3GZc+ONglYEK854P5uTQ65spIGWqHfsrRnICGe
 z2K84pbgakY6qM2f7rg==
X-Proofpoint-GUID: ih3PlJKrl07NWqvksEmczxt6I9VzDzU9
X-Proofpoint-ORIG-GUID: ih3PlJKrl07NWqvksEmczxt6I9VzDzU9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160093

On 3/11/26 7:46 PM, Paul Adam via B4 Relay wrote:
> From: Paul Adam <adamp@posteo.de>
> 
> Add an initial device tree for Wiko PULP 4G.
> Includes support for:
> - UART
> - USB (no OTG)
> - Internal storage
> - MicroSD
> - Volume keys + Power button
> - Touchscreen
> - Backlight
> - Accelerometer: Invensense MPU6880
> - Magnetometer: Asahi Kasei AK09911
> - Hall sensor: Rohm BU52021HFV
> - Proximity sensor
> - Vibrator
> - Earpiece
> - Microphone 1
> - Headphones
> - Wifi
> - Bluetooth
> - GPU
> 
> Signed-off-by: Paul Adam <adamp@posteo.de>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
