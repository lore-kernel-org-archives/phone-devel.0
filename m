Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579022;
	b=KfDC7HfhmJfpl1tQj6tHZNDAzALV0GW/qvl/b7zXBOJw2+CTP6K+nKiMY+HUKhVYVUwU
	 cvPsNfeVO4aEBTYUttEE8cu9P+6g0i1UkSGB635hAomN15vUPzd6JTrfiIfXFa1uW71SE
	 Yk6dM6PKAFLkQdRif4pTc++kmAMmYglo61GKErsBscUB/u7Dpqn+8PtQ23TaMTnSahSdu
	 clVSunAqkWbxPCnmqGAyPydcI4BYmixm7qM85pstMsKuzv6rGDGwWQluDzaVa6uUfrzRw
	 Yk6OnLt2zJZknBqCzjeJ9u2OfOPdxWDF5ynRMSMusHaBbngqz2sqdnO9YEhITVk6lbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579022;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UpnBt9NDkA/9k+zs5ZAaN4VDwS58Xsye0Nv0hvpKxiE=;
	b=xh/GHZKOdGMjQhzLMDEZOu9c4Qol66RbUNzPCpk0dKjvzmBAjlr+3UsEGABRXwUQTdhj
	 KBflY6V9iRf00A1msiNBNOkDQsW7+54HE1GJdEUdk5ifMdMDHw8RTFXq2+EWVf/IjzuVm
	 yLx4pWIyGC6th7+Gp+zf/hPg5Bcz6Z42Jf7z1ZH/sxY8dMTcQVshgWEEAS2Mps4SNfzy4
	 EmWJ+quhncM/1HZlKMRBPGTvx+rjuojnTvHTIcOsr6mUEUEeMbEvw3LPcm/UhiCZsVpxS
	 CWHtE9svMtwwxyJotEghdW6lAk+lcVz4GRgcxx8meefUaYK1gs5JTcADU2c4I58Lh4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lYvByqas;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B3AhXMHE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A02606A31D
	for <phone-devel@vger.kernel.org>; Wed, 21 Oct 2026 10:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53A02606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lYvByqas;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B3AhXMHE
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LAJX941422156
	for <phone-devel@vger.kernel.org>; Wed, 21 Oct 2026 10:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UpnBt9NDkA/9k+zs5ZAaN4VDwS58Xsye0Nv0hvpKxiE=; b=lYvByqasiZYQc+Mw
	9/c0oEbK5E/s858jw6UQLLt5Vxr2aH6UxMfnu5Jx7lJFoQWeVWsbSIwveHZ+lSl9
	BWBY8ScKgyXvQKN7gEW6k6Zbs3JfdemxEcmy8N3PkShAfpI2MfD5ODL3X1w6GLgc
	9hOKQ0ybQDCHAXCu4Urc19lmx2RWHh5Oo+QH5jEudEH0WBbHmu25KygHnESqQQqa
	qA6H3+EhZWQKX1PZ9HAsicRBZvkgmQD5b532sluXsh26oYKyb7qRk3l/xhnTAUv+
	pQGiKyPAsobOXzTYG6NIzoHfKFyrVBVMwtQVShHhHaMnwCcH6RRQnlTMhuW9yM15
	43dK3g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heuhug1ua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 21 Oct 2026 10:37:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc50fb0d2so9457285a.0
        for <phone-devel@vger.kernel.org>; Wed, 21 Oct 2026 03:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792579021; x=1793183821; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UpnBt9NDkA/9k+zs5ZAaN4VDwS58Xsye0Nv0hvpKxiE=;
        b=B3AhXMHEF/HDQ81BnijAdjSTKZMV9rz7FhK2ZdDoNjtLGQ+CyOr7nyLzXN2/76NaEx
         G7soBe9KLY8Vk9gdg9JWA1hvl8Hi4QV2RpR5bRTOnYc6//AZkgM/2dxrJYfyjTDrz6/3
         Vy+3/yxYElgQIKlnUbDuo3dHxfedBJ4Gp0Zdj5aCvT8tcNrBRt+xIDfclMe6kJ3xKiut
         DZG5wnTNtZeiv7yGCVNZ6TU+3zBoyynylSL70nuAoWqaB8VAQaNow9QBvLlUZZ86DGLN
         0HED3V4oMHUnNiXwF5vXBwrV2YlAGp8D5/LdZ0qml/H5wEckG37aJ9oNgvTpzMNKRDxO
         zxSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579021; x=1793183821;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UpnBt9NDkA/9k+zs5ZAaN4VDwS58Xsye0Nv0hvpKxiE=;
        b=0+GBkohBrl2UVACbZ+P68cs5fSek8Bp/rSRQ21m5nzYIriJn44XPGWvdrNw7EgA8mG
         6wg9e8zrU+Rbag6KIDCT5PfEcLWZKaixu8xUgwOay2+a0fb5syPyTlMCkGNPocOLl6l7
         /sEnNCd0UvSge7wQ4bafion3Xu5v/Q6XkZP6Kicrxn6Rd/qTEZVILIlJxnAyb+mt+zzd
         hUVXZy5qwK06d6p1cZeW+i6K9qjCtA/phgE8cP/y+ndDPqpGj15L1qWWyNRt7E/bXvhE
         aQexfZcno2XTwoBmUjfwF1aTsGrfNdV3lEUMwzBzPXctRgX1qz1t+y8eNIVgXu5B4Orl
         4cYA==
X-Forwarded-Encrypted: i=1; AKwUvByU3jsxYQrxmvFEpqCCN9tIB+HLnyj7Qu4yK8vu76KYAzSFBruR76fwEqsfEgy5uHgeOIvvr0Ggk7YaUA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJRbaj2QPRXwWxZdOO61qNhUxVwIsvAYNhUzqyKoi1PUwFw93tR
	PMrjYw8IwuJCLs0/ELbJrHO6f4YCI+RZA1546NXKji5A+r0otJ9EhvEIe7C54/UgbTB+UB6qgiY
	Q9wEywF+5o1MlAg2E8GIGz37pALRj2wMNSA96PZyHyohbOKedRb5DUMmY9iIZcKeBfg==
X-Gm-Gg: AYBFou1Hvu1IN/GcnXEgyZfX1ecg183MwRX5t4bzmcGp3GRbcheRIA2wQG945djpN+I
	zvlIZ3egnC9hXjSSlZ658JUn+BF4IZTdTN5jARF1hiZtzdi8vlUzKngTw9XjxtyY2Oj+fDZDkQe
	4ACcR1w9qXHnbpIgr4LZMQ6ToWT3p/D+P6uTCJRyctIepi7yQg2bkXjm+4YbA7sbGdd/CC8Ka+d
	RKNDUFQhk2eslqZ2HxPw7mgZprL0IQXlNaxmyBPPNTMp9spmnudnJUPAqKwltUs0OMudv+WA/zY
	RNEqPiZBrRrfX5br2DCtBJMmaEVdIFvw0O9iFYZP1wlGjiLYIU04u7qZ41EgceN3CTP4lwv1KHW
	kxD0+HnhuEKr3BADGEvaeIQ==
X-Received: by 2002:a05:620a:1d09:b0:93a:14c:329c with SMTP id af79cd13be357-93f57e3e05amr417909185a.1.1792579020816;
        Wed, 21 Oct 2026 03:37:00 -0700 (PDT)
X-Received: by 2002:a05:620a:1d09:b0:93a:14c:329c with SMTP id af79cd13be357-93f57e3e05amr417904585a.1.1792579020322;
        Wed, 21 Oct 2026 03:37:00 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4030dadecsm673656a12.11.2026.10.21.03.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:36:59 -0700 (PDT)
Message-ID: <14992ec8-cd5d-4245-997d-4b5ac93d0c46@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:36:56 +0200
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
Subject: Re: [PATCH 5/5] arm64: dts: qcom: motorola-dubai: Add sound card with
 aw88261 speakers
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016073157.611956-1-val@packett.cool>
 <20261016073157.611956-6-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016073157.611956-6-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=d4JgWhjE c=1 sm=1 tr=0 ts=6ad895cd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Uo9H-UCNI7IvtxD39T0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfXy/Z4qOr/qwp4
 7Hi4JNXIBTgGUmZB+RFKtA/RZcapaMTMpM9AxjaWw8RNVxNIOaDJr4g/UY2qAq/xzB94a3xIjCN
 qrDeQropZNI1wkW0Sxwu/BmH6TDTg3o=
X-Proofpoint-GUID: x277bFZ_fCXEJFOMVUsxpcYEG1vVxxpL
X-Proofpoint-ORIG-GUID: x277bFZ_fCXEJFOMVUsxpcYEG1vVxxpL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX88yBfb7lj9t4
 FfYgXaKKwpBTEnetdeY6N1LcBWhJnNLqBsVPWzKAzw8h5wy8tjCY3KqRY5sfc4z8aOGwNNlW0Sa
 Ra6qge0+G6FWtnaIQyGQgHevEbPj3MwtwPyywcfdJBxu0r4tRmQpntY+ib4wiV3k7uu96O5C+Wc
 vtnmpBqecSA9kb7kXdOfvkmeywzMdO3QV3boHScURz+CiraF0dUKOXqBe6xGwvC9AyOKZuDPae4
 /DJHpJn1BDAvDPLPnn1dg3D8ohMwC9NIMwHu/WBT8zh5UUvbWyz1AawYPL6zk8xnG/K+70mSRdQ
 cDruN15vcyYtC+ChDJnYBE5kDj3eXIQISreVhqUm8WoPDTHBJrVkBVpk61n9+AFa/REJNjX6TKx
 fvQYxsjXCvr+8SI/0QhHkjgkKAJrPuXXxD/drpS3RTyTtTPj+wPOW4gPnj7tHD1gwbvN8S1nvei
 CPTrH3wObSvunMlPAyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210042

On 10/16/26 9:31 AM, Val Packett wrote:
> Enable the sndcard node with three MultiMedia frontends, a USB offload
> RX link, and two Awinic AW88261 speaker amps on senary MI2S.
> 
> While here, use the correct compatible for audiocc for this phone,
> and remove references to power-domains from a 'reserved' node.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
