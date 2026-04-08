Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762093D75B4
	for <phone-devel@vger.kernel.org>; Wed,  8 Apr 2026 17:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775668515; cv=none; b=jA3JV4KcLoBcTJzwPDUjeEpfu1hrXHhRgwth4nF6fXnygbEDMfpyEGUQjlxB2dRHPJF75iLrY75/O2AJWhgblv+tsev59C/CWspcTMp09M8lGjBIiIlOv1vl7k8EhVhx3D3gD+AqvUg/hHOXBB8Ka1EHi8cJyzK/Gx2MBncUeVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775668515; c=relaxed/simple;
	bh=D4FRhcOACF7pc94x5qgQDchbK6AYknnWBfZq2d/BUHM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=n5LU6fb6hEw4/jKum5ioB9pPW20XryNkfgLccCyA3hKgR08JbxdwfcWSSWoad9BwLyhG6LMeRh7IM1tJVoK6YMyOsJDcdv02bhycjcSgGAZ6o5Gh6mSLGN8ziAQdE8YLcbCZhphYQscf9XPm4ySMIlWkHpxL49ATAdthtmPNM1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZHURPQup; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G7HzCL37; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZHURPQup";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G7HzCL37"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638G4RA52845045
	for <phone-devel@vger.kernel.org>; Wed, 8 Apr 2026 17:15:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	irJPjQOx57gitkVQBKC9OTFjeqNhaQWRfIuH/klmg8I=; b=ZHURPQupUvXIcRP8
	pICTvVdooRN8cXy32/VDBb8wPKJ9N2p2SxSy0kxPDXWrulWeEuEn6ho3piHldMSG
	LaUQUc34ZPsOr0Lx8HxpAaPYT7SCG71jgs116W0fUg2JCoemZipzbWXUYRwb9rBq
	IAUo+RVALSX4M8AiXoixfkI75CyxySydSJAFSpe1ZyTVNjitRsUeywLDF6ottSdT
	LTMc2PuyqMciusC5x8lZrOYjJxUwnmIN58PSTfNeZL0vriiGY9Q8vMSwxli4FXts
	9Qlmy0oR0ErjheQZfh6mvtXzUkOAUJuQKU9J5mniouumL61UV79jtSiqHYlAswD/
	bUR79w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt7hg8jk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 08 Apr 2026 17:15:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b0bf2b3879so2154175ad.1
        for <phone-devel@vger.kernel.org>; Wed, 08 Apr 2026 10:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775668512; x=1776273312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=irJPjQOx57gitkVQBKC9OTFjeqNhaQWRfIuH/klmg8I=;
        b=G7HzCL37pzesdz3/q3K/WWdCFeBudWORNzC7jAV9H/q8oWrkU8lvSY43m7EdloM/gk
         f+e3XZWl7qUzYX9nRTcKvk0mqDgny3GPga1Rb8DckXqYmt2n9s0TjoiVIIV9pyOx7wpv
         kWXghBlD88TJFeTHSLy0KPnDvaJpHWZVfOz7+lj0+T6K8A2cXasfMjC7cSIuPYMGFLpk
         sZsGzi1twxgar2P/3JbeYYIU7Mp68sQ0rQWdHlJ5M8C+anbKZWCbg61xTf6Vfau4U500
         Bn4s/IIJqNyUxrmqd7kpT2CEMX+HmYRdESvcU2Q7Pwr+v4xAfIXxDmDFnsLXfUaqoVgv
         jXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775668512; x=1776273312;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=irJPjQOx57gitkVQBKC9OTFjeqNhaQWRfIuH/klmg8I=;
        b=KvphZFRRzvqrfZg3bKVQcRBs1p7w9BPWo4c6oaBKhXromH0SRiYFU1UuJnfiTt6RWT
         ljaVKP337upiDun+Lm9HQVv3iBLnbUxemLvIOyFx50jUHVaJC8LCuEQTldeezw4imQOj
         cPoOkq7ZOilUIvpa/ReiwiqqMjmZ1PF1eUENGHSKLl9S8ZjX8BoKRb6T8a0tLobMwmrI
         Y3izC/dEkmItrRyotCuEuslx0Obp8lInSdykXnd/e19OY2AN/3vIberj8YQoE0m38ZlF
         YC+eO9V1qHS6N9qvk5qgFif2xTkQZIs+hYgQSN2WJBB85SaOzKYyj9Nm3iIcfxAgqThI
         G/RA==
X-Forwarded-Encrypted: i=1; AJvYcCVtu4XEbzH39hLIq9/IgNktIytIXVCz4yQxAF9NkDr/4QBO/7Zkiyf7dw+t6YzzSdq7XKyYc8cMq5L9uQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx8SWctL7Cn6SlgUpSubgVoHb58qm2FcqClmwZbnmsmlQiiZUE
	GeEluvyeA+lkFuQFWvwysTlOUFW2pK18lShlDYILWPXRDD/tRyxaGVyd8ccxA7dCR4ha7KgTg8p
	wgTI+iZsyu8cRl6GAtSMXk6LFLcnizdBwOr+5OTlS61LQRMjRoshim0D/bDwMB0D/7Q==
X-Gm-Gg: AeBDievmqQyPNQgAAtbgCOhZ9lXQOxJUIxn4LRTAOrodZuMvYChmUibimnHYS6qHn7d
	WlBlnz7awGoTofFmC79ZBQY9gI8nUY32nJmG1ZmrkN5WTNwtDPFUqE89S/9RX3X/P2prkHBej4D
	5o7ilbn86ELYkpH3VIXiE9kAZ1eo66UNJpTVL4bHqdyj/mo8g42oO5J8jO2fjsbFtrek280Meaw
	ll7eyDJk6fBL50+zYXurJVoEUB7Nl3A8d+pZalA8Y0B5C9MPEpjAkdx5tpToXreGbcjxcCQgFKt
	daL8E7ukSFIiMoD16lu3qc7zYOrs8Bb+GnVD5kP6kJQZv2bW7k58UaMmWPrhi19N0GLNONLjYW0
	uUbbF19FX0hx6iJygFUA02LaeiaWSIqaxLePHAIthMjAOuTn71QqdhECNfeWcEil8a8pDJENhbU
	8B
X-Received: by 2002:a05:7022:6881:b0:12a:b39a:339f with SMTP id a92af1059eb24-12bfb7451abmr10809580c88.21.1775668512028;
        Wed, 08 Apr 2026 10:15:12 -0700 (PDT)
X-Received: by 2002:a05:7022:6881:b0:12a:b39a:339f with SMTP id a92af1059eb24-12bfb7451abmr10809540c88.21.1775668511298;
        Wed, 08 Apr 2026 10:15:11 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm26103624c88.0.2026.04.08.10.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 10:15:10 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Paul Sajna <sajattack@postmarketos.org>,
        David Heidelberg <david@ixit.cz>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Amit Pundir <amit.pundir@linaro.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
In-Reply-To: <20260407-skip-host-cam-qmi-req-v5-0-dfa8a05c6538@ixit.cz>
References: <20260407-skip-host-cam-qmi-req-v5-0-dfa8a05c6538@ixit.cz>
Subject: Re: (subset) [PATCH v5 0/3] ath10k: Introduce a devicetree quirk
 to skip host cap QMI requests
Message-Id: <177566851037.1322920.3559253544691274000.b4-ty@oss.qualcomm.com>
Date: Wed, 08 Apr 2026 10:15:10 -0700
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=O5IJeh9W c=1 sm=1 tr=0 ts=69d68d21 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=XIgAiO59-CApRadi8WAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: EGZuAoZ_j3Zy5CUNMQzGl7rkBQuS6Y9t
X-Proofpoint-GUID: EGZuAoZ_j3Zy5CUNMQzGl7rkBQuS6Y9t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDE2MCBTYWx0ZWRfXxLkmo3X0D1xw
 e0tq7GwpCRJJxxtQ3Gki1aDwoD/9v5eVXiy6Atd9lfjKcbilB8IWQ+LOaEXc1QVVzh/mNMYqBZk
 Qfu2JH9zr4rHHepjZOzupbkyCX2JKiEBkpwON5h/nUnoSQxOq4ZCPYLNZWtScqC716QF8OBn0uF
 3mjulluMwy6S8UPdg3/bM4ma1Ja7GckkHg5rhewtXr/8UaJjrqsr55u2+lNazQ1jXgl6h7xU9Km
 7gFbE7WEOGS/9a+kjiDottLcrA7gYGp6UpMANloQu+wPk116vtRBIlnfkI7fVGcpbJY+fPt2999
 wNrflZPrGQXX5uz2p1jq5+VlpLqWeZwQb/w+duuNvPze+QNO/HDmd+htOxxYF6TIuosBL7Qcihz
 8UhmEE+JoXDhRVTai/NdVayvqn556g0CdeaPNDT3I2GNP84tEBUg8dGYWc6jl9AfOk8605e2cET
 TMCNOixIijbtQpH2y8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_05,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080160


On Tue, 07 Apr 2026 08:43:53 +0200, David Heidelberg wrote:
> This quirk is used so far used on:
>  - LG G7 ThinQ
>  - Xiaomi Poco F1
> 
> I'm resending it after ~ 4 years since initial send due to Snapdragon
> 845 being one of best supported platform for mobile phones running
> Linux, so it would be shame to not have shiny support.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: wireless: ath10k: Add quirk to skip host cap QMI requests
      commit: 3d7640b6c371a1795e6d9580695d20caf16be9a4
[2/3] ath10k: Add device-tree quirk to skip host cap QMI requests
      commit: 6a7693873b20680a3c33bae0c9f9cb3185f64ade

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

