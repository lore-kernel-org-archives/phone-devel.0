Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794228470;
	b=1RWLhTJKnhB4Sv3SIs5/NUWaJLAC3pKkuCGRABSbWhdUSe97NmQtz/w05JzEAB4SbRi1
	 ZLZdUuDtlflF+ryQu6ovCGid+63rxUCoqbUUMdot7oZW8ypY9q/nHlj/l0yoMiJNf8IDJ
	 1+Bxc2EKqylfTgx9cNAPorHxR3le5QPxCwzvjrNmh9nJRRzikdB3f+3RaOngktx+PuzMe
	 ccDwMzoGu7DWtLJTV24DeYV0o1eEs23cXtrT0yyJWU+8YhPnB+jPspGMcLfi/ft87Tk6w
	 2/1wZU7VpB8QDQ5OrEI9fe9/Vhq3DI9d9Tc/iC39oiCfZAOlO98nI8iay09WHDRuVYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228470;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TeOdNADF8PbWanyh3zeJ8VVtqapoi4A83pKR8WNo47M=;
	b=g7ez3HG1ZrAmiWslPtxS5785ac35YzSVntQ+Wu8YeX4nvSyuXwsOetPYSFfIR4S+8Pw3
	 EZb5bWQ89YyGko+xkIWmu7Veck6Pzy3684uM5IeEob3pNFtsgkbX5QCrxivyJ2Ig6KfLQ
	 ii3rx7hrRAwVoS4AJXa2BlycyZTvxopLd52SqyLdMhRDip93xupn+P7207GSLJJyX2QKf
	 snArdk9OaAZVd38GKaQYRh2IgJeETBL6HrejAgalU2LtpC2CoKVVtMub3CmZsAbY1ADDM
	 GxDCHoiaDojj0bdr9YU5lyAIjvV6zbu6I+otnVspRgTeMZBpD9aWoatHTvslnPkdqhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B5lOCSAL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="EUdX6/C2";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7179606A339
	for <phone-devel@vger.kernel.org>; Mon,  9 Nov 2026 12:47:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7179606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B5lOCSAL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EUdX6/C2
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99ujFS3600418
	for <phone-devel@vger.kernel.org>; Mon, 9 Nov 2026 12:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TeOdNADF8PbWanyh3zeJ8VVt
	qapoi4A83pKR8WNo47M=; b=B5lOCSAL9XED7EOwzb4VP/rR8c5y0c84FDAN1u0f
	qk5AdWusuRIEf33+PYlELJrIJuy7HCz1ZwxVIorihS2bNZ2pE7YX3L7GhhwNpKRL
	Qkb2o5C9JfDntueUG78WSDFtHPg3OEDe1CBlJ4ZLSgVYIJcOaDVRpFi8Y7H0h4kO
	jcxoCBsR8cHUZlTcQTHOtJufPVQ9wKTDfMG65dZ7V2gTZCW1Y9N2SRAMlQFUV4iL
	JiWTHAKpg620K7Eg38p8B7K45pZT2tt9WGR/1Qgl02CEUTR78EjhbtuP7/TpNYup
	Gz6h2rsMmi4JIO8q7QgH6kwYrfbPLhqVcDcyMrNA3Wqh4Q==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua5890s8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 09 Nov 2026 12:47:49 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9997828d6c2so111846241.2
        for <phone-devel@vger.kernel.org>; Mon, 09 Nov 2026 04:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794228468; x=1794833268; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TeOdNADF8PbWanyh3zeJ8VVtqapoi4A83pKR8WNo47M=;
        b=EUdX6/C2waqexumt93zXVr8u2q/mqRyBKML2yyDMKNlz5bZi8UMWdRmlWLT+PAACMw
         Jyel0GlcLXPYZooNWZ4imwfEaqI72I1/S0ym3X/fNK6PMwkvlMStHSOvRb49Y3rctgPI
         +t7ec58NuIsjEup0FT/NRAmto/keqrWcI4qBqgnyoh1THb6noxjzUAy6iDOvWN6AmP4I
         MVml1/AtowWTEcrVGf2sfqBP8UFjRxUwZ+ElhZDOYA9zRBOFNJP8LetV0s2lpAXFmyAE
         SDbW55zurnSq1C9j+omrC3dKwRbbeHtMCfMw4qROc2fZla+HFFWAA7mwhHvpPpRUnYca
         Nd8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794228468; x=1794833268;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TeOdNADF8PbWanyh3zeJ8VVtqapoi4A83pKR8WNo47M=;
        b=WA84L94ZbHzpiEDw4a8yC7AV7iH8wutmVSeRKYahFdMFMWqpj9NQY/CInrhrDYl4YT
         6kIBjtheFk1mCZq92LAFSWtLSRLzXhakmAy01qLdAb7rKxzw8yrOQMusKP1PF3P0JiV+
         e6+uynKpE9gHd9lcA2jEuXrlFsFvC9HY/RKffnoIkDkgLLZpL16/PlNCXea8wXQlN8+h
         kv+IAPw1Elj+HO9KnrPa6FEQ6vZXxu3liBFFRpIANYk0MTHxYBIbY67bvLk6A8tTsNpB
         a3JczrW18m38u1wvXg1llxXiRo2hUaK1cS+WEJuBNv0Z5H45gsaaCx8EjbLfCVs1MO9Q
         s9Pw==
X-Forwarded-Encrypted: i=1; AL+hErEriUqaC/XpbO9BK4Rpl7IZb69NtCyLt1b3TvPltwJ/rNmJ//KP3dMS2f5/4VXWhcj1EDwc1Qo4IQ3b5w==@vger.kernel.org
X-Gm-Message-State: APuU4Z9/IRInpQeFDcssoiIwcJQZLBLulJVBGV4bOdCMwqAJCd4dc/Ug
	Eyt2+fmAy41ppBICHiYeXHRIj17z5NaASU3GnC5kKENSRZKj5F+BbXEQzUvJEtosocpIv+XmVAg
	qb5TxLgEhJuY94U2CPUPiYb8cxvI3MzDtnkMgfAchnlU7z3nn1zrPSZvQ35A/t1QFXw==
X-Gm-Gg: AYBFou15rgwLHpH1iUg8yxn/qH12MWCoVBdpmTOJpIBvBI8HFKfxJaHZD6FEuoCZkzo
	Q5o6TZ++ShY9rUBB8LDXODjNVqRkZMdeaeTifpMoQsLD7jyG30yErEA+ibEouOYSB7NBzGOSfO4
	Om8hs2oukDD99Vm0im5T3eVLBfzxzRy4NVgzr1ARvbkR7AEoSfTPii0oHrzi/hn8nwdVi2WB0w5
	/cZ+/ut1DTrlXLg6wE/UuK4Rm7YZHbTJ7bIlD8AXUfE13tjAkBQkEKTsK/+zL8gtGOAyBjOTBRO
	m3E+A34cnQAwasW+K3evJNMmAE0yj9AafP5TnFYRQ39i95cSCQ8U7ogIpqZdeEFBMYUTnRDdvco
	mA19DQc7KXIVtyHcwwXTYc0Rb2dSXMPOmQHxKltvFN8ZFmim2T9tEEISXY5ZAdz0=
X-Received: by 2002:a05:6102:915:b0:7cc:56a:58da with SMTP id ada2fe7eead31-7d2db0dd505mr782550137.23.1794228467863;
        Mon, 09 Nov 2026 04:47:47 -0800 (PST)
X-Received: by 2002:a05:6102:915:b0:7cc:56a:58da with SMTP id ada2fe7eead31-7d2db0dd505mr782530137.23.1794228467118;
        Mon, 09 Nov 2026 04:47:47 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb0b0c2sm207416945e9.8.2026.11.09.04.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:47:46 -0800 (PST)
Date: Mon, 9 Nov 2026 14:47:44 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: david@ixit.cz
Cc: Dzmitry Sankouski <dsankouski@gmail.com>,
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
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Petr Vorel <petr.vorel@gmail.com>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 10/10] arm64: dts: qcom: sdm845-google-crosshatch: Add
 display panel
Message-ID: <nt2zeflxqbnxxb5v7p3ncaigrwlzatspcx72be3253bsq2t24w@q6s7wvdb3k7w>
References: <20261108-crosshatch-panel-v3-0-87dd4ec4f7cc@ixit.cz>
 <20261108-crosshatch-panel-v3-10-87dd4ec4f7cc@ixit.cz>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261108-crosshatch-panel-v3-10-87dd4ec4f7cc@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfX5XpWLdgIsH8g
 aELwkUjMOaR+5a36rgtT+pJ3tasbqDiDISsljeHrrtLWM8DXoh2OvaPKVCKIjZit91CMhk07OSh
 bU8txU44dtBG31K1C5AKDdv+qTN0lqtzqqGqzOm5Sf8H44SK6YszX5jpHFj5PEzIH9duvYek8D+
 96avKdOW0sNPPFqpXovIAbqXpnVjHZGtSVJQawCrdvdHuqpvDQpaI9X+NRKjwXw76E4Rj/PljJk
 j7QhOaBTaguv7/n0clzUu7lBCjHZMAJRMwSfXkTpUjPmVo2wS9zmuVKSwxRRgyrUg1T81x9GaIz
 SaUigpxymR7F5UFK5vT8m8dUqp7B4IQ7cQvtg232VDAzHmmivp1jjglCEJODPj/rCDlMp6Np/Mo
 roK6gvzCotK1USsbSKX8XFf9AmR7DJ3qYp/zxZveZ6nHJywuyZPfOojH9yuXU8uzlTQWph+NJLI
 Lb0kwQXXCyTzRjohiSw==
X-Proofpoint-ORIG-GUID: U8TaHqpV3Ph_L7deYrerxwcb3XdkisPg
X-Proofpoint-GUID: U8TaHqpV3Ph_L7deYrerxwcb3XdkisPg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfX/+pBERLc+H9N
 zNflDkSvLpKbiY3Vr6wnCqg0FU4Jdy8Aui56q0lvLW9sZIO1Fxo6q3/PyOalC3cDhRRmOt1hvgC
 abi+M6/cNUNABomrgRYrb5twiK1YXTs=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af1c0f5 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=v1rLgdUz5MECU32CcTsA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090050

On 26-11-08 12:32:31, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Wire up the Samsung AMB630QY01 AMOLED panel on the Pixel 3 XL and drop
> the MDSS/DISPCC disables that kept simple-framebuffer alive.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
