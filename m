Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4123E3F58C4
	for <phone-devel@vger.kernel.org>; Wed,  2 Sep 2026 08:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339240; cv=none; b=GX5fBXoZmVJoZ3EUssGxV+Yz90ZU6DQmzlv6UeN4ecaGVd0JdG+dOJDsAyG5H4q4rEE7vO1EoZ1P0NF56JWZO7qVGndsD+YjipGtnIBkPJxJz+iMqTFoIZgQlyzVfgBhbJs7DaovaHRVjNAMfqGqCGsf0Edpdw7H3um24IrKHJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339240; c=relaxed/simple;
	bh=dLNPvtyLfzJQYiYO1+leMhmhyqiin9MHtSdwsymE+90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fA7caMm1sKq/oArc7NqmLN5+yo9JlOKlj+yO/EoGZhddhD3nlZuFXP8r/V5YwNxixlz+RU9aLoOrQJi1IVWxufIQt2nHrpcTtyE5K49oabmb7RT1oFxVDayJIbXbow8RBZPIVJj44eWvaRJvwqw0ToZvzZF5zxjezq6jcilFBDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MLQR9UWG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iJspL1dw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MLQR9UWG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iJspL1dw"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826W7NB1205586
	for <phone-devel@vger.kernel.org>; Wed, 2 Sep 2026 08:53:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ROXUs3SwZXs49UllWw3FErqQbUnANYqcoInUD6cvKSM=; b=MLQR9UWG/RYTDl/g
	LlIxDSFUIfsVHOosDshPqn5D0kS/IaxMD4ukwvBe9qclL2M/bBK/YCZBwiUc196M
	sre97ye8MnVuHRYuU2kQfm4xJtsEkLr5FocRxjUwEHz31e1omWQt4fAA8XbTAL/z
	aaexd8Z4ZRrGn+KFJyLW5aceE4il+/uyQymZWrj3vmSWMukpF/3SvQ8s8gOwN/KH
	S4JWlbPsJD1UKuEUNYUUHDJ0AXOwtqX4Uv/9hFK+HDuZJWzn1ilvfzhZOaPj5LVT
	3qhghN3/lpYbvZGryQvGJSxBEmGy17pmKx3w1BG9lw71dsRLwqIskN8YawrytD5e
	rWGjsA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdynt4c3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 02 Sep 2026 08:53:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52845bd815bso2137841cf.0
        for <phone-devel@vger.kernel.org>; Wed, 02 Sep 2026 01:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788339237; x=1788944037; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ROXUs3SwZXs49UllWw3FErqQbUnANYqcoInUD6cvKSM=;
        b=iJspL1dw+whxMrhyiLk24ncofM83kEk/HjEPpDfwVwExuyyzWEmm6y37aQyCQnFHpF
         E2cYCiLZazb+rbK4T8Qp4u6UftaUr26Vo3mw0aonNcrXYEDQltUpg0l9Ar9gB2WjO1dp
         8g4NL1BkkwoTDvdErsWkN8YEsRhlvPaRU+jdpgWNpIzVu45FvwQTUtU+lokDS8ovKiza
         Fd3oOE+w7bFW78bqQGa0F46YGom4J0NCJBrTF0WRczMtruaOfRoG8W0VFO7G9sHz65BJ
         PrHgfIg4aZpGdOlU0aNYOW9qiYaSoyPNohwWxrFulfPr0dEpQUlFY/jx+OCvg9Grip01
         NhLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788339237; x=1788944037;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ROXUs3SwZXs49UllWw3FErqQbUnANYqcoInUD6cvKSM=;
        b=r+bfqcxwqc7wX3tKvZZfo6tl9quuW519HlJOmU7InUKzoaudtSXH73wmqDQGUdwVRQ
         wj9hKw9IE5XQAc/NFOTGxtXjQmT9ECosLooyWRm72aoY6rKeZ1DjLZKKQRi4jmxELQ0h
         K1IozoFU+FsR3fH3fckX/HhkTEOZps9C8KP1cedc2dTKLpITmL71Q6XSQ0l+D2R125yb
         aDnQOC7Ydz4tBpI7DmKu4E0y0ErjnjgBxPSMuIiErvKN74Q7y2GbMSvJTXnGOFzjhYh2
         xuyNp6VL+x83HlWNDCwmS75G4f0eEFlvRXbP8qEmQdaURNlH2CyrwOi5Ox4AOmCgmtoJ
         gGAQ==
X-Forwarded-Encrypted: i=1; AHgh+RoIvQRXmqBWLIHjTMfKS9+mDm3NGBYlVoZxfI4sT1AAjBlgQ31s9D5ybdhZ2U0cZ49Rh3GlqrqU97WC3w==@vger.kernel.org
X-Gm-Message-State: AFuF++loub9gEoLdkjpCCAtDxhqPuFGTodM/8mzLzcq+pt6fe7y/Cd98
	zaK/1eZdJujBqs8pYFjIPz9ElbfiaT5wpSDmjvs4bH/XvN0XxICVII9Zjn0bwVsD8GajtXX8eDV
	g+1jtRcTSkgHI99VPrXsb6vMjIHV6lRz6QGSSR85EXSRhRucWUvFmp56q/M2twQij2w==
X-Gm-Gg: AR+sD11qDr8+4aztb0zqMTIClyb37t4SvbzlDduWVHaNDMMicxofelDL/zbhCByXM9F
	4UUFc4cG0grKpNP5czLyhsX3VQanB00jmtJcwVLcWEzbhOJVeJKzXkvD0zyDuOrG0iOgS2FWNTi
	dye8f5d0ZwBGWgCqPA1Wa91q67T6ICC6NfIGZvHYwATmsimqaD5RsFZc/gDZGjR8d9bAqS8SDF8
	jSRQa4uGOmqxiRgjvBiNefpMy4QthRsdj4ZicEjdX5HeA42lyME0HwQWdGmJ3YQOXARd19LnaeE
	YtJKDne8zyN3lsaKIMiPzeA+ND0oyYtsOlEKD1MZg9LmnZV63/Wm11SGTbJgveXQAjW+i0xRGGc
	hNFoET9u301Rc1mVnDq/Asg==
X-Received: by 2002:ac8:7fc1:0:b0:52d:9db2:7924 with SMTP id d75a77b69052e-53036b81bb1mr17657851cf.1.1788339237250;
        Wed, 02 Sep 2026 01:53:57 -0700 (PDT)
X-Received: by 2002:ac8:7fc1:0:b0:52d:9db2:7924 with SMTP id d75a77b69052e-53036b81bb1mr17655961cf.1.1788339232055;
        Wed, 02 Sep 2026 01:53:52 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f942fe4sm715364a12.25.2026.09.02.01.53.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 01:53:51 -0700 (PDT)
Message-ID: <857bdc72-fa8f-4dc5-ab9a-16ecf2903a24@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 10:53:48 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm7225-fairphone-fp4: Add parent
 supply for regulators
To: Luca Weiss <luca.weiss@fairphone.com>,
        Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260901-fp4-regulator-supply-v1-0-68288ab70aee@fairphone.com>
 <20260901-fp4-regulator-supply-v1-4-68288ab70aee@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-fp4-regulator-supply-v1-4-68288ab70aee@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3OCBTYWx0ZWRfX9gnSosQmSdRP
 0r+JRjjgQMdX3g+B/1KOm5oeStMCJZiU5HjutFLXT/qcYwD2no5WTirfQQBTHnQaCMKcYQEX38N
 Oee8UjyxnNIHEwMeINoh59X3oGcc9ENi3QrnrFo9QFthE1HZDdmen848axaLPpOqAuDAsFco5kP
 vIW/XIZlGjqkrYhQLOzXqiA9rxiYyUvpQI2+qjdExA8cR71jWHZBFC4rBXf1cSMzcjdLy2TQuVf
 Weo2vuSEB95sGzVf/miV2A84iw2lCgp9uJU9ngTpqCrPCu/nEJveBqsypK0+5RRffdy8ux6xr4i
 Ck4qvR5hc3j0XeIgGjiihd0Sy71eHYsZTMgloJUMtiLUfi0UCHQzO17HPedkWupvo/KlS5er3GQ
 4pYdOQFH2VwK6/WXaC08aWX5n6K+GDcBHpp8y9nC2ICQGG80lBvBPkPcSAkB81uuiZf6wNm5oQG
 kiClFStRbBbJzxqzRTw==
X-Proofpoint-ORIG-GUID: N_1_dxwwXaLO-YoGP1Zcp4HjcvHRhmSy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3OCBTYWx0ZWRfX8tBSHYxdvLj/
 j5Fg5FPZrl24B4b862uj1jCez5XrydhPwlfgIjHxTFl7rUPIkcG+ArY7twagCU49bYey3kceqL1
 ln5eE3MLERKL5notYA4RTmaMxRBW9lo=
X-Authority-Analysis: v=2.4 cv=LfkMLDfi c=1 sm=1 tr=0 ts=6a97e425 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=fBQ15DjUyzdVHG486VYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: N_1_dxwwXaLO-YoGP1Zcp4HjcvHRhmSy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020078

On 9/1/26 10:58 AM, Luca Weiss wrote:
> Add the vdd-*-supply properties to the rpmh-regulators nodes, so that
> the parent regulators can be enabled when needed.
> 
> The regulators s4a and s6a are a bit special. They feed back into
> PM6350, but are not modelled as regulators (or anything else?), so they
> also can't be added as vdd-*-supply. It would seem to be possible to add
> them with their "Default on booting voltage" from the PM6350 Data Sheet
> in the dts, but I'm not sure this is desired.

Yeah they seem to be strictly intended as being part of the internal
PMIC power grid.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
