Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4946D3D565C
	for <phone-devel@vger.kernel.org>; Wed, 17 Jun 2026 10:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781690716; cv=none; b=VBrBYdM15XXVHHCBQfuSb6BDTpGt6+mBXw5EKknOmVVH5+MEATO1YxNTa0RVpsjjLs2bZ5TpNd/UNURbJst1Cnr9V+BHz5RQDXG6fW/hlUbPd9X0at9et4Id316DQIGnM6R1pYQCNNHQDwxhT+2gNVXXbMVkSoUvNLr2KgxUtPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781690716; c=relaxed/simple;
	bh=5TxvZppIuVK4IbjAthVhCxutkqy3HZ+yhexbIYSVtPA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V9Xb7EJKzC6rI1DysUZgCqct94RL6ZBXXv3HALxY1LUaLz7yh+RIKG27xYi0JRaKqJ5bgnXUi//OZBqYqqPoezpvc6yqCOV5SDYG/1x9+vbdGBxod4DCv2ANAIgdZF0ZrPrkB7M+IImyXJ4mdR+ZzT5CO7e7MgLg36Cdu/F3DOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TzyDBHuG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YvnwrA6w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TzyDBHuG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YvnwrA6w"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8Vqqp2192032
	for <phone-devel@vger.kernel.org>; Wed, 17 Jun 2026 10:05:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G/3xtJbSgpRVggmVdlAhVnxw+ha4tmbu5w4Ruonole8=; b=TzyDBHuGE0f1IEdm
	9V9NIeNbNQDb/0iqMZTyuniZC+ryNCgg1zPpFpCJCj/bTaVZhjC4IJAratuOuCJy
	ku9yMUEKH0bBi/jozOQUqItvOty3CIJwa7uxyN0UIe06CDzjCtkTI5pRk0WS7bOh
	ZfpvcKAaFXyPIKVs01ZjzNfp3HnlNGV9Aw7fGKr0a8Grg9L8gnmI9BWsI22e1JmD
	aScaO19J7tLldH4liU1GeFxHsgqws5ZV8ODpQJoGDSHZcUdKn/cbF5oH6PZaXh2T
	aP+BNQ8KBtOi7TpFmNeB9S/amPwszcJaSd1aKJdKAvdezqlkagqgaeBMc+6gYrMU
	kvHVRg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueesjkgm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 17 Jun 2026 10:05:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517bdeceb54so13194101cf.2
        for <phone-devel@vger.kernel.org>; Wed, 17 Jun 2026 03:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781690712; x=1782295512; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G/3xtJbSgpRVggmVdlAhVnxw+ha4tmbu5w4Ruonole8=;
        b=YvnwrA6wN0QbP1JS6MwoZKMlQMqcuJWg9yQxBiHoeooMle6T2HRAQc37SVauKe5iG9
         0RoPpQ1ubXcnYUYEQuOn/KX4etcMD0WOoUQfn5rF4rs+4HKJsopRNIN3VT8mVpzEe4HT
         BkN5xBujcut5smLgsHqwfznYOglfnWAlbUnzNaSBkVEOwmMYW/r11whYxj5kZGbHNRuS
         nMe+PVvajju9XGjW6D1s5vyHNJuSJw4e50kn5GkFNChfngQK8r7CVV0eE0SJBYg5coGI
         mZ0pFgf/5HSIoXAMv3ua1IFEV38k/CKJTXbWTHUPQqjlIVx8MwMREt5dOfmSYcSkBw8K
         NGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781690712; x=1782295512;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G/3xtJbSgpRVggmVdlAhVnxw+ha4tmbu5w4Ruonole8=;
        b=Plq+P4nDVnHji51cjlWcMj+chsnWT+/c68jTm4VKDZbhfvgfOJQf0OssHR52WgeLn5
         KuVJXG/8PoxbI+9nABYNYBY9ahwnIterntdKefaS45ZqlZZIUiBwiBuFIcRdIKoWLdEh
         3FNzX0jEYoKUPTUMSmp+ZkhP1JqZibNqwpyCfmN0pyAwFFHd5LgoSntHO6DCKbjktV7W
         0r3hugDXkVlKZ6TdnYGisqR86HP+E97f6hwFTMp3kg2kQv8klzhAkh5QPRfVnmHZ16/l
         CWcTPmU045N6BXG5nR5N0ftmBvsSsAgkjY2Z/ag4ECjS6S8Z/4cm4eJ3C13mMprZ4V0G
         H+TA==
X-Forwarded-Encrypted: i=1; AFNElJ9zZUgQz0CEDicCVfEo/FCEiadJWOwPb8V/21Cy+ltoelOHQMHZQy7tVVzztItmymhW8hmizc0rEKzwnA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8auZB0DTYOV5+XaVTVKaxNvH7/MUG47kJqYtSxrnAg6PjjGYG
	NvSo0zKUFShBiq4dCL0gtOPT+Qa/L3eNsUcuGXpjgdrlc5UXBEsHgPNmodM2u+brktwYXFwfjLk
	PlvRslMbsOxKgenWXZwNQS2SoaFHnb2RZDTHXpq4h4nrcQZSFyzFbv8MK/dJuuiXdfQ==
X-Gm-Gg: Acq92OHi1zvTDVYNGEqyinMrRpOfRQQKO39Ud2LHn4x6wVLKyeN6DZR8Nf25zWHE+T/
	yJy5VFa0vbPvh01LYTOyDgTc02LwHZIyGNGzzWk9tiRwX4dM8x+DBYIoMRYCrdvihu4EyGO35S0
	9IxRM6y2YgfxudhOGCk3yHWdKHdOxmUcHQLKscYx9BuRoAE9YauFHzs7iBnL+loCLVPXuJQGcdA
	g7yD2v4VdyOxxmYnetedqpRPjJtwrj9QjI+BGbwQVjBAqDSUa2p/ylQbuDvghJ8Xay0hXF8TmU+
	Rk81Ui3yNBkk8jgExH9FmKyPW2F3B2EkUUcDEOzWCn71Iu7z909X1HFhIuglChBl6IEdCIpEPIY
	or2xEnPBpvqHYw5K0a4vroxGsgIRQbh0XC9w=
X-Received: by 2002:ac8:7f91:0:b0:517:5d21:9899 with SMTP id d75a77b69052e-519ac25db63mr22095961cf.5.1781690712306;
        Wed, 17 Jun 2026 03:05:12 -0700 (PDT)
X-Received: by 2002:ac8:7f91:0:b0:517:5d21:9899 with SMTP id d75a77b69052e-519ac25db63mr22095711cf.5.1781690711861;
        Wed, 17 Jun 2026 03:05:11 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c01ee8286c9sm484557866b.5.2026.06.17.03.05.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:05:11 -0700 (PDT)
Message-ID: <b39e4b4f-c166-48e1-901c-51694cf8172b@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 12:05:08 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kodiak: Elite-ify LPASS macros
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260522-kodiak-elite-macros-v1-1-487661ac1270@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522-kodiak-elite-macros-v1-1-487661ac1270@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA5NCBTYWx0ZWRfX/vJCDSeX9ly9
 kBtquj4N50kUyn9auoZBymicXzHknDfcST1DQDO271AIzknPf7HDbNR8hZ1q1cN5qGWzr7br33/
 kroylEmOdg1NLZf60Ls9qpiFuzSSTZfR67/zgKB1U5Nh4vnkKYWAoDwhGqrEsKpdmfoK2TiqtFc
 vYdpqAO1dIZ1U8ChBlkRtF2MWGs8AO8jxaBp1DuOvcNVIOjB+EIjT40MGzo/RFspUj7bVDH/iTr
 32ho4vQhCK/QwihTZHAWTuTvipQ1O+s5K9rv8TWrjlBgVzrQERaK17py77Ji0g/YAJ16+UI6ov8
 ZapGwJ874fewRMFviePD+RrSMPGsBCnPzqnOtjMJagQPV68cnRTEgAVgv0/vEFc5B5ZJj1zJ5YG
 gqqvs6su7kA9uZKm5icbLU9S3iD87MoS0j87AcHYmCPu+uMRRw5hqjrCtcFGE45/b71W5ijJKu2
 wYY8+gQ4K79UGaIXAmg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA5NCBTYWx0ZWRfX5pKGbX8tH8XZ
 0CnGkO8N4pYu2eCjUkw09AM+0hyS2N+jQ9GB7xK8eVAPG9HKVXbqP2DA2VuApmnId6bpgfpMbjD
 nKobRFdRpBWfB19KcYuP3AL07qr1hMs=
X-Proofpoint-ORIG-GUID: 2_u_EdUEg84Z6HWaB0AHZhY99knQzF2t
X-Proofpoint-GUID: 2_u_EdUEg84Z6HWaB0AHZhY99knQzF2t
X-Authority-Analysis: v=2.4 cv=ePojSnp1 c=1 sm=1 tr=0 ts=6a327159 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=UVdh9-GTA9LMwvOUMncA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170094

On 5/22/26 4:46 PM, Luca Weiss wrote:
> Due to initial kodiak/sc7280 bringup being done for Chrome platforms,
> some Chrome-specific bits still remain in kodiak.dtsi, like the clocks
> and power-domains for the LPASS RX/TX/WSA/VA macros.
> 
> Move them to sc7280-chrome-common.dtsi and put Elite (q6afecc)
> equivalents in its place. The qcs6490-audioreach.dtsi file can also drop
> deletion of power-domains properties then.
> 
> This follows previous commits moving Chrome-specific configuration to
> the correct file, leaving kodiak.dtsi for Elite and
> qcs6490-audioreach.dtsi for AudioReach.
> 
> No functional change intended. The clock-output-names property will now
> exist for both Chrome and AudioReach devices but this shouldn't have any
> relevant effect. And WSA macro clocks weren't added to Chrome because I
> don't believe this would've ever worked given it already referenced
> q6afecc and the nodes were originally added during AudioReach bringup.

I think it's better to keep them, if only to make sure that the result
of dtx_diff isn't outside the expectation of a commit that claims to
only reshuffle data for these platforms

It looks OK as-is for Elite and Audioreach platforms (for the record, I
checked rb3gen2 and FP5)

Konrad
