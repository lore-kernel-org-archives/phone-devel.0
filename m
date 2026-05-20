Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE68F3E8C5B
	for <phone-devel@vger.kernel.org>; Wed, 20 May 2026 13:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779284497; cv=none; b=Q+co75RIvDuFy7se8kJqynqcET1UHhjDgQym7TUmxBqe+JIAUXeyv6MtKuRlU64hPTmg17A1v7zDeeegpvrdfiBA6c+AFN86EINdgzkGUY+FrOlLj+0krwwd7StNQdsrqpBcnaUkVWlJM7LWAXUsx/ITyIZpKnqTgTBl93DZrgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779284497; c=relaxed/simple;
	bh=wEK2ABOen3tV8/HsKkDV4io4ZqYKyOwnkK33x92qIKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hx5qFgq/J2HNk3JVEdEY2TDOBDN8T156zgJqNDVmwianPtOiqpIKsXTi+e4LgNk/N2Nx+SI8cbZwzvhd9ABhBQIdq5+dqUMMxJC++bto+fDLX3smWEEUMWiB1+4aybQCc8XIVIC39+ONWSS1pL2hIAFJoXa6aDTlHih2RE++4bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TyOcFmXu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M4x/xH9B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TyOcFmXu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M4x/xH9B"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9lsqG267212
	for <phone-devel@vger.kernel.org>; Wed, 20 May 2026 13:41:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dVfCWmu9NnLwt3W1x+6m7XcP0Pmlw7T2tdZJKqO170Y=; b=TyOcFmXuYAaJKYq7
	Nc33wRmi0pLyZeGFKkhtc+r9Zjjy3XQf0DrYorpagNjGGAzWsxIePB3LUq+PO4nn
	g3TlvTkK9SCQC9sR9Ul21euyJs6Q6WP2+zV7j7rZL0Melw/v8bVG5QMIWsG8jwh2
	RAKIRfcoEaRvvz4LXASoaEuHnHAIck2xbYDKg9bpNi9LP2wg6KGVoZ73+LMnudxI
	fcRlg7XWwIYBqdVG0xmHy5Hhtnbmzv3g4x6+wIL0wogc3lRgWl8kKuqk0CpTLRi9
	XL/M8BhPSZwkcqssXvY5qeiym1W66nhpPgjlvVUaoFKxDOdVdNG+I0ZmBZT8EI89
	LTzldg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9amxrtr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 20 May 2026 13:41:34 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-956732444ffso9272999241.1
        for <phone-devel@vger.kernel.org>; Wed, 20 May 2026 06:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779284494; x=1779889294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dVfCWmu9NnLwt3W1x+6m7XcP0Pmlw7T2tdZJKqO170Y=;
        b=M4x/xH9BiyAxfSSoFVsm2LYHAKwX2/Tu/U/lRW7IWmF1vsAaNIEt+jWFjVuKtLA3EE
         r5tJNSOd9gwyQFtTH9K0W9x46k5yPUN2w4e9VP7wMKkRt8+yRwum/DqelUoWfRJU8QLq
         sXGqDE1uQvEmiPHeeMwqlggs2E9/13VlUmBV2dBSHLdsy/pmBLm4fXc9o7p2U7MG7Z5p
         LY9yNbkY+FLAntzOzSoaTyXSyUFC66ED1ysEyb7dT53JdMf426DcJmOiZo75YxYRccxr
         AQrYwkXzgrz1ITuOvYoK0vAIunR/dLD/kfkofJAVtfRKVv9o0qttYPUwwcEh1YourPHm
         eVQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779284494; x=1779889294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dVfCWmu9NnLwt3W1x+6m7XcP0Pmlw7T2tdZJKqO170Y=;
        b=FV3v2By1dwiZmaTWysdEW8n8Y/InwLXLvO3vBB2RHcS89o7ecSvdsD0w3vlIHPP+7A
         AKg09tRhpYjraCKwAbuRl/tV9/uB8UECF3ISppMgJw67n1Fp9q/9zjAwaM3CIJmy0nHI
         xCORDIbhEcztUqWdi350/YcNZUld/4XWzz/MMDyuNrvmtNJLH9f28WQCCb15m0H7U7n3
         BLzaANv0ziMhpbeZERZoVMmuirdqUBaQv4vrbZxqNAc4W+4WOYWAXh3xtDbpi6Ub0zc8
         MKhCjnEQ1wVhHZcHBcZV9vcqbak44mVrhWUkyv9R3QHGim1nOl5NaninD5oHLr1mv+9x
         Vvfw==
X-Forwarded-Encrypted: i=1; AFNElJ+hBjA+3Tbqrzzzk+9fvgnOwAYy4R9b1nLvaNFCTiRl3t2Pz+tKzb5jXQt5EjwXc9VVYsm6A/ZzM2x/pQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YypxBS6zgKareeDekw6RdqLUemj1rwgZSF1X1iCTAwaleV+Q5pE
	aCbvJ9xVbyF6pBD3BkN+PIpNrXsv8yqT50V7DhJ2mO7Ln/JPm+dXJzhOZMjiUyIo/jNP/97Sz8X
	bHvMD/D+7bRIWxugLVwfUWYFw5et9Z8sT0jb0ioGH+Q4SbSdLK9jKD5DmkDt8cZSzGA==
X-Gm-Gg: Acq92OEzPOHEEcaHCrLUPwdR4bTgVJ9ywP4SfDeO++hmWM3aqwA7jPGe85RzTApvlTD
	K2RauSK3rgnu9zKcdtCyJ9nluh8awLHlL9roUrClsTKLDRdxZLolsAKm4qvuySwNvQK440M4dbp
	v9dggLon80TvAo/aQmQgkcOEGeP5pRRkpromCY9apS18SJkvRrpoduXc/jsi4EUaigtUaov0Nz8
	Yq7isCp65e7NRJiBOOZIcI0FrMsoxXJmKBEz+9LNQMH2bWGVhBarmzhmXeaaBlPlmMvoEW9AD4w
	zfpbDSzOvqA7UIpHayHX9c8woSukqnbJZR/A67LnsuqMNF6RHOfMgVtlYcr4h/0jCwc7c9GQGBt
	ZLv7Xs3QE2AKvu1s0vUcT4CXxwYeb7Cr46A7QEx4Ec5UUweGe7EW9Qc0AG+dOrkp5nqfLzcZSbL
	vW7DAmHiOlGzdXX/WlmlY5BmufD0gJ3Dr06sU=
X-Received: by 2002:a05:6102:568d:b0:631:44d9:2ca2 with SMTP id ada2fe7eead31-63a3ffa2650mr14672525137.30.1779284494166;
        Wed, 20 May 2026 06:41:34 -0700 (PDT)
X-Received: by 2002:a05:6102:568d:b0:631:44d9:2ca2 with SMTP id ada2fe7eead31-63a3ffa2650mr14672480137.30.1779284493670;
        Wed, 20 May 2026 06:41:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164bc3fcsm4997008e87.48.2026.05.20.06.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:41:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jonathan Marek <jonathan@marek.ca>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Alexander Koskovich <akoskovich@pm.me>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/9] MDSS / DPU bringup for Milos
Date: Wed, 20 May 2026 16:41:30 +0300
Message-ID: <177928444229.2567181.2193286518117779172.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501-milos-mdss-v3-0-58bfc58c0e13@fairphone.com>
References: <20260501-milos-mdss-v3-0-58bfc58c0e13@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: tw6m6r_G9CS1pqIYILkuwcQkv8MQJGM_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEzMyBTYWx0ZWRfX2eVXijcnINXA
 EtsRbJo1ztG2lPRND7C+8dFDG5CEfoMqrydAmQOlCCkh+YC8pkqbhfdf3REx9C/MJih2vaDp1FN
 5gty8I67UMc+zAJ7s1Z74Yh3b1Tktp1SCEOF6xOjlo5+hrnAaRH3q7jpCKzzDZRHS9Vm25dN6yL
 YY6m75ELBawQMmz3jBK1os+LLoT6QARAIcm2CPdGI3aLP/Op5mqJBCmr+BUIZ/rdciXJUqIlIV2
 uiN1PWkQIIepHaV5+0v6PTYEFI3BACN7W0avK2ytN5dEVFff0zcKYVZcGTCtMXeVTo5BH1kw/ZD
 1gTz0nROjIui/kvmzoyG2EF7BtVRb5TMOHiqE9PnLoqrXaYauF0JZKBF9nMaShui5Yhz+v3/ZYG
 C8u8B27Y/2AY7QmKJeQdv38WzjqKyVvGjDScoXsIpqQ8HeOhlq4GaQuKhEMSyK7kW7F1cV2lnf/
 YUzK4Pup+dekXUlJ4BA==
X-Authority-Analysis: v=2.4 cv=TO11jVla c=1 sm=1 tr=0 ts=6a0dba0e cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=e5mUnYsNAAAA:8
 a=dydZwlHECne5IGhmaagA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: tw6m6r_G9CS1pqIYILkuwcQkv8MQJGM_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200133

On Fri, 01 May 2026 09:14:42 +0200, Luca Weiss wrote:
> This series adds display support for the Milos SoC.
> 
> This is tested on the Fairphone (Gen. 6) using the SM7635 SoC (8bit DSC
> cmd mode), and the Nothing Phone (3a) has also been reported to work by
> Alexander Koskovich.
> 
> The panel driver for Fairphone (Gen. 6) and devicetree enablement will
> be sent later.
> 
> [...]

Applied to msm-next, thanks!

[1/9] dt-bindings: display: msm-dsi-phy-7nm: document the Milos DSI PHY
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6a64e18774bc
[2/9] dt-bindings: display: msm-dsi-controller-main: document the Milos DSI Controller
      https://gitlab.freedesktop.org/lumag/msm/-/commit/fd2ce4931c78
[3/9] dt-bindings: display: msm: document the Milos DPU
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5354032dc203
[4/9] dt-bindings: display: msm: document the Milos Mobile Display Subsystem
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f5d66543884f
[5/9] soc: qcom: ubwc: Add config for Milos
      (no commit info)
[6/9] drm/msm/dsi: add support for DSI-PHY on Milos
      https://gitlab.freedesktop.org/lumag/msm/-/commit/bdb927095689
[7/9] drm/msm: mdss: Add Milos support
      https://gitlab.freedesktop.org/lumag/msm/-/commit/88210726c65e
[8/9] drm/msm/dpu: Add Milos support
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a48fe7aa0a2d
[9/9] arm64: dts: qcom: milos: Add display (MDSS)
      (no commit info)

Best regards,
-- 
With best wishes
Dmitry


