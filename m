Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795782459;
	b=YHwLb0b9DKugT1wLnzVwCqBYGi8HDgZ9Mg65EQNUPLHOk1/GU107qqrC8s/BqCHFjMXw
	 qDodXSOCVCCMnZ/63jTRNb1SgwbAEGoTfVy/1IB5Vldrz9kcHPlj1MqcMOti15zLTGxRj
	 DCYGZ+nb4X6VpmQvR7LZveJehlIQqmZrsOXOyHoTLpYjIO3bCd0vPyWQL6FRAiJN6LVvr
	 Z/m83KiIP63S0U+hKPNlX858De5PeVVxGsYaJTaSmDH3kZVpECaim28DlgGotkB8lMxjf
	 yFrovt3rgDTFKIATh9RX/EvC0p70+DsOlP2CcO0A6Z4i/nKTbqSGxIUR35VY1RJYrww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795782459;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=11n06xHUhUpNy9Ekpged7IOoqkR+QpoFDE5ZoaESnLY=;
	b=gHrxcmoeGi9hTAp2EtFeWr6QMFM3IERSmSR5UaeesUgv+I503kgpt34AN8VPw5KkT0kG
	 OclpcMkVSTM3hwG8m/iayt3iKmM/HQJGbHqOWZ+qUMubKrgBxmO3kxzrdrPfjLsrRZPVT
	 6QI4oJYbiVeBusigdJrYnPTr1BTwzBWgSTGLTCe5iwwb0Rgo9KOApHac9wrtvLiIUkaKe
	 W4UfpFdZG5oRBgo8YGTuiqmDBZqSXAdnmNWxaofpJxW3Lq/BJ1yp2xZC1SsX/p9WL9Ecn
	 ubkxWQHwPSqZe6SvmKJT9Ate8Vj+KMGoDihCqSCOwnZOGN8FnWU/iOazc9aePs2gImA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FjKDdGF7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=brLOI2dl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5BE606A31F
	for <phone-devel@vger.kernel.org>; Fri, 27 Nov 2026 12:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B5BE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FjKDdGF7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=brLOI2dl
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApAiv2906401
	for <phone-devel@vger.kernel.org>; Fri, 27 Nov 2026 12:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	11n06xHUhUpNy9Ekpged7IOoqkR+QpoFDE5ZoaESnLY=; b=FjKDdGF7X+XkRq9/
	MXyrQkko/PPi4y8oYop6EuxujwZUSXM6+dGJa/2bPE+BBUlPn9xFIImt4pYelgrP
	UDqemhTPiX/2tiOnRI9gMsYib3VWGheswEuCpHEN1RSJ1T4LnCOPfAG9p9cSdoGh
	TgL597+3q0WmLfIt4N8C4Rby7zInxKJqxfROs9Smsmx272Yod/JtvvVgsFrZIpSC
	SX5RwWNxLIop4hbUW2kL1T7DHts1GZvtpyByMs1Mpb+Dv/FtpbH5Xw3dDFoWy+Xc
	DJ78loK5RgPiPvobQMvh0mKhT1wwKHSmh+FfNSP/T3ZtAIexCaOg2z/lfpJRKB/J
	rtdUTA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf93g41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 27 Nov 2026 12:27:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9495f7e03b9so78187585a.2
        for <phone-devel@vger.kernel.org>; Fri, 27 Nov 2026 04:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795782458; x=1796387258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=11n06xHUhUpNy9Ekpged7IOoqkR+QpoFDE5ZoaESnLY=;
        b=brLOI2dlMBcvSa0oj4XrWcI49biEwBn/hxERcZUpXyz3eGr5mkBwTXAnG1XzG/gMCh
         9oJl+AM+vkwVdtglbC7efEaZwdLdh5C2C2Sf1LcFxFtd82WCiGKvWeTxJl461bH7Ayzd
         7Y3J0kU4c7GA89yE8DLPYc3RPOTQwy3PeMtoiIphfVF56F6KVPQPCydS0wkn47030BpM
         9mP39vjxQkz2HxnBIMtgnkfg0BHEk/AKH2SX8zmUSoE9iHOAK9W1j6sJccT5h2bLofzH
         5dGrZ2OAKmoHVmUSgZjmJNa9jNdCbAulFAYmZIwmjT/Ndv3c5ixyuWCqubcrUSYYZb6f
         EHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795782458; x=1796387258;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=11n06xHUhUpNy9Ekpged7IOoqkR+QpoFDE5ZoaESnLY=;
        b=23rbzoyPLdylexXRfd95wmsTp+quOFpFVUVgUoQyPrUdVn8+S0PYvpfaBRoMsV+mi/
         LG5TBIfzdrsDGqBB/GSZonUwAUzR7kNsnqc8nDSjWq6hfDJVRUGi83PCDFB0T83awbgt
         opTIxvFAgAts9V41UaYIw5g8BkLZOBPEFMjzyE7uFbDxOjjJoZiF6tdrgaO08MtlBygl
         NTtiTT7sV25AehzzQ2iJIF2lb0pXXGZ3kW3DWEH3KQiH4Ap8Pi/Tb87YwJSx17wOSvIS
         ucb3Hu4kcdR2OuoDfVUA2Mwam7p8nuntKOpx95w8aTCs54Wx9MaPa6BJPP8aIcesQvDS
         qvEQ==
X-Forwarded-Encrypted: i=1; AL+hErHwppwtJQPZ3LGpRm3ePXA9iHN4bqiIwdhBYIVJLeS7jvcvwiy0EBtGt0KdKnh9RNvHu7hMO5m1m/P/tw==@vger.kernel.org
X-Gm-Message-State: APuU4Z97WN9OuIOSKywshMr3ToBxQAukPr5esO2owI/XfDUi0fVxtfng
	D7cAhVR9Y0bt/+FfMntC+ocHsc4CYZhkh8IDFYM8xH4Tr99W0XTUf1wB8Q5a8R2ZV90JRiizkHo
	a82EX5OKCukKLz0AiYLjQhLkvrnSggsc2y2E5QAT9FXCnGL1TLqpZz53qhrAOCNrabA==
X-Gm-Gg: AZFdTZfW66435unw2iDBa4Y4sMynwTXYkEq3RG3ggkwIK9eRnhg/GEMTAdWOyZmhLlE
	/YU3rY3jb0hl3LYlvkI+AKhgP3kzG0/YDqo4YdYoPmIE8DUMUO1eetfqnI7leRQJUFwaIccXAF4
	hYzlbke6bJzvtTx/nRiEG+BXSX3k9GNgjy3NP8UGdq3hrdnc7CXaP76nsrT9BnpGJZkcCDI2sWg
	yOp9siYFYJKhN8IVCkqgHxAZe9mYOnwnkFFwDcAyd6Ct/tzy4rNb+MiYuQyirqYKGKmS9s70XSn
	/3TkH79N9qjk0ssNuSPGT2df/YG0KyL7if2veMY8shCBHM5cFinug1AW+01+srK94Y9RerVx556
	7HuojalvWq4JxMVUGZf5j5PTV2iNj8XsIFyvVXGGH98fey4shcwTh+RFkvdBrB+bRkknP5JQ=
X-Received: by 2002:a05:620a:5632:b0:949:a1be:c22a with SMTP id af79cd13be357-949ba9dfabamr3985057185a.3.1795782457693;
        Fri, 27 Nov 2026 04:27:37 -0800 (PST)
X-Received: by 2002:a05:620a:5632:b0:949:a1be:c22a with SMTP id af79cd13be357-949ba9dfabamr3985054085a.3.1795782457281;
        Fri, 27 Nov 2026 04:27:37 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba36e355easm10501705a12.3.2026.11.27.04.27.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:27:36 -0800 (PST)
Message-ID: <765f3451-0f2e-4783-9a7e-893c06b2a735@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 13:27:34 +0100
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
Subject: Re: [PATCH v7 1/2] arm64: dts: qcom: sdm845-google: Add basic audio
 support
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20261111-pixel3-audio-v7-0-ecf28efc5c33@ixit.cz>
 <20261111-pixel3-audio-v7-1-ecf28efc5c33@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261111-pixel3-audio-v7-1-ecf28efc5c33@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rJyqOM53h9zXaFLWvXTu5U88iXv6wNbX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0OSBTYWx0ZWRfX3f006jg37VMx
 bOXFMK8ej2uJhPkyRRYsX45AMT7Sbc9KONJORyJdeZkSmMI6zgMJqfcL4GXGbSLXEEDEeoXk0gm
 9vG4MXqqQLN7e/RE1XOfar2cqJqZazw4meRxmtPu1XAdgXzdNL2VXGWAKE6xVGjfpcOh3d+zbsx
 DCo5Z8VeG50U+iC4tYWqVnPTw/85pYC9EzJcqPs30hPCr8GTnw2Y1iJtEU0cFg34VrC7zF47NZb
 hOdC1/P23mmPOfTsbuYtKPMYEGA8aX2T/O5PQTz4Irv6YhLS3WwltK5wPyeVIBGe7Geq7GNm7wP
 OG8daH0wBUQk6Ys+9qSCkdR1L3OTuq/hcNFN1t0zvAAs5vE0sd3sJzZ+/MtpsMt6gfC/Zsw18FW
 X6U5snu2LL080oIMLHsyWU+rkYsQ6Hg7LonFX1cegkCUGSX1c8b7YZxCZpFJIbtXNWj9qADyLFN
 FV5Tb+v4HPeilygoWwg==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b09773a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DuBmnH7L3UKxGZjpEfMA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0OSBTYWx0ZWRfXxHXVaokSQUdI
 Kqw/pIoSkYhiZoLDzFTkSXyshKl1fLQeAUcQHjWDaWO22dnc+Puyg9xtmiVOoIwbJ0+pMn9TJTa
 S7iYP//uvljZPn/pEbaQtO2ZOF2k97o=
X-Proofpoint-GUID: rJyqOM53h9zXaFLWvXTu5U88iXv6wNbX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270049

On 11/11/26 6:41 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Introduce support for sound card and wire two CS35L36 audio codecs for
> top and bottom speakers.

[...]

> +&sound {
> +	compatible = "qcom,sdm845-sndcard";
> +	model = "Pixel 3";
> +	pinctrl-0 = <&quat_mi2s_active>, <&quat_mi2s_sd0_active>,
> +		    <&quat_mi2s_sd1_active>;
> +	pinctrl-names = "default";
> +
> +	/* mm[0-9]-dai-link nodes must be positioned first regardless of sorting */

Could you try the patch in 

https://lore.kernel.org/linux-arm-msm/655212ed-4812-4747-ba5a-f0093bf05411@oss.qualcomm.com/

?

Konrad
