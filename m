Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794229838;
	b=y0BULaOXjE+v47eDcLJ6o4QWDNS8e7CfvsKdJ4QHSmK4uOpN/HbBly+5RoD58H3szIot
	 CCcGFlSwHRlX0x9P4dVGkaspKcX2/4aIBl6PU66et+Ed15jc0DonR2B6sg/AZwupsbVoA
	 KL65rZ6ztDYXroEwCsiQjcp5sUqkihQImSYH/J2R4fUvttcGGnPS7ekyJXk/3XdHgDLPz
	 0WezzoKCHvlpgG+SeeGCu9OWb524+BbrHVUwpREqac/A9hVqBQrI4Qpiz6MwVBzJUBU4D
	 s0RqRhWgRJzhPH33rY9LB5TfyFu5ikZP6xFS0cORipvNgzvNWZ1B8/ASfsSZIR4pNjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794229838;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cnZsY44wFy3q/HITacB4SEcKnwDZevDNn4+gnmN9bLY=;
	b=fd6WN2AVlNdJaeef4PbRf/ShIHGiSIgp6zH7ZriAmSU3173qSgkHXVRwqoyZ3nDnZXTF
	 Kb96ai1IkOoQ0glv3hnuPkzLHu9uWRXl45yhvHVRiixLprNTiuPOs/NCvGIvUPLQyuTIt
	 5ahVjKIOobu0D+VrB7/wD/AfUTegT0dHzds//Hcv77jVmny1Se9u23Gd67/JVetRdivOK
	 dSzLubZ1PCF0yRRAfYXhBqpvEQzIgfUOsNZ7ubk/DHtEzJiJDUIGrGFG8wahax3cIFL5+
	 Qnw3xU3/mDyt7CC1SI2IXKkGJy4YYO5U+wujnrGGcA9O4E8eTBXfSzx5dCInd9+cfsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="k/1lxwbO";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="RMhgqQ/8";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB8B606D804
	for <phone-devel@vger.kernel.org>; Mon,  9 Nov 2026 13:10:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DB8B606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k/1lxwbO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RMhgqQ/8
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99v5Zt561980
	for <phone-devel@vger.kernel.org>; Mon, 9 Nov 2026 13:10:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cnZsY44wFy3q/HITacB4SEcKnwDZevDNn4+gnmN9bLY=; b=k/1lxwbOE4uLP7VY
	MujD+j9Rh5noUzT/4yrskSNS6wTzY+zyyYhKGXcRYcC2oZRi8QTzrHJ3mShp2tCy
	JldXh9BfcQxQCXhYl5podohUWvhuIYtOr3atR33Vhi3J2/An3iDrALGWugu9fd/V
	BCX57x8g2fQhu3xrUUqnydn2tR+z5JTPPBGeaQuvlfXGoCr5GJSXT81JR7GUVLvc
	ub4bQrSpLpYp1MnYURxWW0zXAfqO7SU9NmMdKJTTu7OtzZAmR0QnMcXsTPYMaJkf
	0ClzobaQ1lXp9iyd1quFUkg8WLgw/aQ4aTHz7F/Y9rWFgCm0CJwEQhfQZccfgnpA
	dV18XQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsujxegc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 09 Nov 2026 13:10:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53630cded29so3182251cf.2
        for <phone-devel@vger.kernel.org>; Mon, 09 Nov 2026 05:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794229836; x=1794834636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cnZsY44wFy3q/HITacB4SEcKnwDZevDNn4+gnmN9bLY=;
        b=RMhgqQ/8B1ixzrL7KIk8+Ia4ZImzMFBkbSw/YBbwUW7hsIU0b3UFZ1aWQcRYsOnjTA
         tZShaaJegRh27O1Loz1YElphTYVYPUpWDhXEjzz4Q+SNxs1ru28EhRUxqssUH/Ts+Ppp
         x+bSyPcqisg9o1mJBuz2LJEwnmcdmR8Fw8AWn8BmiBUE1h6JuUoUT9yAGq2Sgr1XLNjC
         ENvpE5gXhLUT4NlZhXezZRrW/ndbiRqP3bFcp11Rw5RegxhzUiNXvBsY3CqmCK+7iG5A
         3N/5gNHWc6QR2FxQohmBh639h8n++1bfLPsXF5pqkb9zICsReqC4P070XCZNGncBVd/6
         7YIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794229836; x=1794834636;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cnZsY44wFy3q/HITacB4SEcKnwDZevDNn4+gnmN9bLY=;
        b=H4zv6qZn8m9nBcXedQeIoRVw5ouhHhIT9yJr1WW0x6lpMBGBQbAn2GIYD39vk6djN2
         yBC7dUcFuq3BxL/3lHSQa5tojpxC7pKQc+u/GbwJyoSdLaD6G5nNzixgdQa8jHWCtxFF
         G3FBw5Ms6dncy3nr2BsxqakMzG0mNFDxsid6SSFnmDO635lvGA0gv/zhGifxfzT2IwIx
         kER4KF4OUcldM5dNNoIKUwcvGbeuSwyLZFfDEb4GnNMvoSrIDVit7O+EL36tSTlSPiee
         sE/fU5esl1lJqTuYWiA+0q7p7JfGHt8k3at9Tbjihcn+91RRC18OYDtGbJucGiRQUiNc
         yk2A==
X-Forwarded-Encrypted: i=1; AL+hErHDOhtxL6ewVcaeiXAJH7r0U9YSvuNN10v9RoqmRnGlJxPpq+GUT3rZJJ2vr54zudEchrXXiry0KPxjYg==@vger.kernel.org
X-Gm-Message-State: APuU4Z93M3j0QObyIoOfScLkP/EaXKHXxe+2ZabmlU2HzGlICNcNkJRE
	CUv9qcQxfWqIfYKULoWdf4Ihd55262pOOBOZyLe/2SX7igX3t03XA81TLT6N3aRsWe3zkhhxxcH
	QIVFU463jJhJrFNGiOV22BQPaa7y6VzCFQa7GJKK5u5eXZW35G3VDQ9r2CHkQfuVw3w==
X-Gm-Gg: AYBFou2cH8oAkVmtU8hwCXvy2G5aCbYZ/5F06gkdnb66Gp8G6Q4B8OjlbGH9hUePtMr
	XZ9obZ3TblhhnkiWquWmNe4CqZ7/ZkZ8LZ49kL9ERxmlacZOa5f2g4S2Bv0I/LPusAXKNeKY9U3
	HsnKnXgdKPyAtGFDE4aPSj1WZUsPDY3UajxYI0Fd8VKjd6YyHpYmqePviqoEI4D5QxC52f5zfug
	K8G5I1Kl6DxiQPHis7/M9eRWRG/ygggetBA4YH8Nveiqm8CxNXdm3RIkW/pS5T/7BGKohj6cPx4
	VReuIgBgCdZqBlIrCOqhICqLaREL5ajVp7MnahHAtr/wiEQGCN+85WXFJ+/yQZxNQiZnevBitTd
	r2LaYoOhziXtwPIfMqBZ7SJqfb2a3Xz6ntTg3BIDyO51Vll+N+IkitW5uVClXOr2OJoHM4A==
X-Received: by 2002:a05:622a:e487:10b0:54a:a0ae:795b with SMTP id d75a77b69052e-552a46edbbdmr59576751cf.3.1794229835821;
        Mon, 09 Nov 2026 05:10:35 -0800 (PST)
X-Received: by 2002:a05:622a:e487:10b0:54a:a0ae:795b with SMTP id d75a77b69052e-552a46edbbdmr59576271cf.3.1794229835244;
        Mon, 09 Nov 2026 05:10:35 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c14b7fc273sm905653e87.24.2026.11.09.05.10.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 05:10:33 -0800 (PST)
Message-ID: <86c73833-99f2-488e-ab90-114f2c9d1c19@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 14:10:28 +0100
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
Subject: Re: [PATCH v3 10/10] arm64: dts: qcom: sdm845-google-crosshatch: Add
 display panel
To: david@ixit.cz, Dzmitry Sankouski <dsankouski@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Petr Vorel <petr.vorel@gmail.com>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
References: <20261108-crosshatch-panel-v3-0-87dd4ec4f7cc@ixit.cz>
 <20261108-crosshatch-panel-v3-10-87dd4ec4f7cc@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261108-crosshatch-panel-v3-10-87dd4ec4f7cc@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sS9q_qTAbZ1LBC7VkItAgJiKhoW1ke8m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MiBTYWx0ZWRfX1pfr6ZFa8CrS
 mnIKQj5X2nQ4XbUcWIs64SXqC0enHDnmWgaRJ7q+vUPWJRi33f3DvBmRFrpyKuzQdhBK4O2UKdT
 Xo0zmiMG+LfkP2wpDuGZxOuBsCyHNeydMo0NsuWWjR/jqdZNjFkcZ/VqxOaJLF3BRTGRuvS3tTL
 Ql94ULpGGvw42NOSodAFlD0PFEBlBTF9ehi0t6F7OAT2tPq2N4iGt31G/3EIEdpAV4iPvy9z4KS
 XIUjhXZSjai8tPiAVfZ1NZ6CEa4M/1HNJ1rxiirQlZFRTj7JJ96TIaBXOo0L6+xwXu8Ni7cC8Ai
 5D7xIoEHZk0/qkof5+pYIsjkOZsBjko4hM8DtzdvzC/r2v0k9N2VUU7nHHtnSw7Vq7CD1aA6gDN
 uh6iqMhig2mmoZiMLKoGhocofZnGlzUy5EvLujN0K9TGOYz1cCw4xgh+d+hG3LFLSPyXragow3F
 loy90yuM0k1+xVDcjiA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MiBTYWx0ZWRfX/kKwbj38nP39
 r8mLPZnzPxVM63lNNO7dplWdyZoQ+tNP1l6SGkukAG4OfnL7+WLM3/SgiEkhIJ0aq01zgGrJc3f
 wkKxp5tW3TJlzwYXQ4PQq/Be0Ge3B8s=
X-Authority-Analysis: v=2.4 cv=TeIDJhQh c=1 sm=1 tr=0 ts=6af1c64c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=rlgZYKK0SKzbOMFyHoYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: sS9q_qTAbZ1LBC7VkItAgJiKhoW1ke8m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090052

On 11/8/26 1:32 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Wire up the Samsung AMB630QY01 AMOLED panel on the Pixel 3 XL and drop
> the MDSS/DISPCC disables that kept simple-framebuffer alive.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
