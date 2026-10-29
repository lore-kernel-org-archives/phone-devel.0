Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793261194;
	b=h4ik1Ze6FsraqYv0oVWNb4n4CT9d3Yi1juVD37kXA24l2FqbOm3MuApjWeRD36OvF25p
	 ObX+X1xxpnJhIc6k/J1KBe8vWzV2VrX3QlvrHJWWy3MBytXGkNj2vUsRyh8ShL0I4SPbl
	 er0Io7iIWEcj1Wq6R00/yLUM/wC7jW7ej5j01BMPlNkhG6fokjK0VjHAlW00NNUbZvSdc
	 1CvsERlwb0bpoExXsWcFkrK845+pzcYqx+egcki8L3R+E41dqFzBUFuv8LAN+ucuGp7gk
	 ca+JW0iPOY3zDcrIKSvQF34B9MdmyXOlo1mirRIZgppGN6mlkxUN6jsLnQJIVQidnIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261194;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=m8DFKSCsdHugXNIGpAF5J7g+hIg6cjluBUQHPY3ZgJA=;
	b=w4l9dREQK/OFC4LBEX4b+K7/GoqhAcphHHtN9c2Uo1Cd3KZ56mENKCXWUfIqbvgDgfHp
	 pgurit5bJv72Is1KpYTO43+d4NFk76VnsmnoYHPInxFAVdxIZmBseETuzni9rz4/l9fla
	 4J7CLaK+YgKYBkdMIidRAfVV2NkUxa74+rRfua9XwEoc/svQn/NkK7puYfufUjPKALJ/j
	 08pbnkEyvvELDPf5j4LA+3v9LeO9rNhJkgoL7y6IyPUKJg0goJOsEG2aBA9UhCjxexGAH
	 /LdmX+eZT+pHmBHPMb4u2NEnc4R37wS4mh1dKW2KD8WmWk2kEwtyIqkAgM83kPJrpVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oHi105vQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QhDuiqLS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB3F606A324
	for <phone-devel@vger.kernel.org>; Thu, 29 Oct 2026 08:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEB3F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oHi105vQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QhDuiqLS
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5HAcd3282503
	for <phone-devel@vger.kernel.org>; Thu, 29 Oct 2026 08:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m8DFKSCsdHugXNIGpAF5J7g+hIg6cjluBUQHPY3ZgJA=; b=oHi105vQq5+kupfu
	nkq7DiBxKhWo3JDmC2j8eL7/8U+tz4p8Zw9W+sxL0IuzjHJ/0jZaAfZnKFTQ+B/c
	mZFBVpuxaKh8LVZaKjauwNrJyHs1sZG/VactDeU+xFAytxJOAOc19F5Ey17V4psq
	NEdcnixVx3y+XrZOhZnb3WhEO++31f/W+7h8rty2tzbQFPFWIv2cQUbOf6XiPPia
	4fJjCIsHFx1lfPOqqcnaFEycKMMkr4cp3S8ZWuSXvvCg+Mm18UAqA6WAXcuPawUO
	F/CIry2q5OWq12oAS5gHui+W3WMTONQIIQ86q0krZ0dFRtcb13sFE2YBSvUmqR5D
	xF6dow==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpgptjwb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 29 Oct 2026 08:06:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ea8a9cfe6so44548385a.2
        for <phone-devel@vger.kernel.org>; Thu, 29 Oct 2026 01:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793261192; x=1793865992; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m8DFKSCsdHugXNIGpAF5J7g+hIg6cjluBUQHPY3ZgJA=;
        b=QhDuiqLSfXhXHNRwQhFoxjcmAPzJqb0vMmDNNFHdxCLXdJ4kR1mJi9roZo5ii1rJgh
         3rKAiCFZh8TVM/bID49J4pOLZCBjq/LvqxkThAS9/3el75Scc4TFtj1NdvKWoC0uJ1yv
         mkblcpoVwSs44fDG/6oBTGCnM0PnJ/N7AO52MowL0n6jeFQ1dD6LmuvXTZwMgM+SKVmq
         phvEmRHa0CqVKQIddING31lOy74Nr4jUckYNj0jhUqfRraF9ehCRAD8SRvKTvjr3KSa7
         h6WhrF06eq4JiAljJMC2pL4gj+AyOyBc0rcQ+uB2r1RGXYncsI1BYloOC8mNzqXA6Asf
         Aj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793261192; x=1793865992;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m8DFKSCsdHugXNIGpAF5J7g+hIg6cjluBUQHPY3ZgJA=;
        b=w+Wp4uP2oMX7nzgam97QIF/SDAzn5GtpmAgcgeXOQdG8r65R1YuvQyKDcC97JRs3Fh
         IKqyI9SYBow8mi9WU2PhWLzGeRhe2ZmoQ7uz1Q5fprLyJ3sodCjT9+czjNksHOskW6bw
         cFKj2IJNBNTa5xiZTGSenwtYSFBd3YYCaqOHQpo7KHLxEkUB2iFYV7LU7FboIcCXJ60x
         arfxSA1L5okkWio4D/c+pMGea78Z3/aEDe5Yqm129VbKUysgWXUhdTRTXPGr6Q2jGTZy
         k9e02eVehF8jSUSanCmo1ECZ+/qdXrZwkzJT94XX3qvN1gMC/aJmD6rEAXT8IDAbOBM/
         Bhtg==
X-Forwarded-Encrypted: i=1; AKwUvBzzH1oDMeS2TxmBHOkAVznn6uqNOsB33zL7kopLZN8Y7edADZ2mH2rm+XBP7QAAFJQ4/Klxu0xHHeqD2w==@vger.kernel.org
X-Gm-Message-State: AFq9FYIJLpWQD/BrE+MEQBH3rVEa8OIMvIlmyFQs5Z6us5FCrgLi9OUM
	qee+HBuz89IwgKqGqI/gvecZksaEZBfJ80V6hDDAurCYXpEG9o1Fi7tW/BqhtNBB0suhnvS0z6x
	HZiy4FLgvgJB+VEjvdx3Q5fI/5XHwfJ5rgGdMIBVrvgscOQjJLk2+bJinlR6rBl9Nng==
X-Gm-Gg: AYBFou2t0pI3WNCE1Ux6Hz78Yy3vC1+DWT/veLYZUMz+F5JVu8ZZu5N8BSiqNDjwVD0
	d2cyyXAmjhcvf0MNwxI7EaROr8IcegZG580ecZ27tRPmk1+UiV/UYIK7Nacr8Eh2sPyOI2Ag9JP
	/0cLpaHOPxoWl8EyAwHSw6J5U9qixjGve0kj+akVRGe+1iLKksqNapRFivkEo2rQEtBuyqL24Hw
	yUdAAywsKbNbaH/cuzQWwePxIoV2zdDym6DPxSdhhnbiEpmIx7v/WH0HQ9Urk9Bq9fZIkY1nu4a
	CDQ0vQV1RcLJXEvo6K0ygiEBSOriQHyhPAbb2ZDhTyKZYV+ZcPJFqZiKBTw4M4IaZMYaAGJnJ82
	vIe2Sm4x7kWNeV4zvVX9X072k7oFjOELA8rIc5CrP+tZ8XqIkU1tGSqJOGLgDolHOq8e/x0E=
X-Received: by 2002:a05:620a:3bc9:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-94408d42cd1mr784405585a.6.1793261192108;
        Thu, 29 Oct 2026 01:06:32 -0700 (PDT)
X-Received: by 2002:a05:620a:3bc9:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-94408d42cd1mr784402285a.6.1793261191683;
        Thu, 29 Oct 2026 01:06:31 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b49644e029sm2428460a12.35.2026.10.29.01.06.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 01:06:30 -0700 (PDT)
Message-ID: <ca9f3883-247f-4cdd-a30d-847b0c3f5433@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 09:06:27 +0100
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
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm7325-motorola-dubai: Add
 vibrator support
To: Gergo Koteles <soyer@irl.hu>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <cover.1793218514.git.soyer@irl.hu>
 <89f7e6e9988c8744be37093777b0bc065a0e2ab8.1793218514.git.soyer@irl.hu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <89f7e6e9988c8744be37093777b0bc065a0e2ab8.1793218514.git.soyer@irl.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMSBTYWx0ZWRfX2SnlE8c/El57
 VWqAK5a5ZQaBVXc59m1uPCYXw6vuOxiXZinJ34idQcNQ0s50TRSnMKrDUxS4yjEDbjrvXtfr1Dv
 kOmt0AMZYCjSXBgJh/ZN1LcZtm+m/vRBYDa1w0oMLKIhYL0GsZg5miymLvoYurGqT1FHEwKlHGB
 qjRHpqr1AgFMHNJHdO+IVv19tua9nY4vBs1bxT8KEflU+E+vKvB1XL7CgThZFt7pmkjHW0meePF
 5hXBa3/oZLL5wZY1D3wG/BIcefMTOEc0/CIDkCKs2vghiuCiBFREZDe/F3AM2Vk1zaGxjoWbTdK
 /fMGlP/bW5R9TxxZgxPbBGMeRjVzkcJ6GWWGAz7rSmZdg0Ivqq+85DyAEQj1gIquk8O5PoocKsA
 jozJJeiu1Mc/yRiGJh/stzUcTuLUTWGfP9Hei0iTksD8Zqy1qNR5lE9C+rYaEdb95CJ9mshsC4U
 WfKg1EdjMbKZVvCrrXg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMSBTYWx0ZWRfX2nvLIj8zkyHP
 K/vlrSmg+t6sDXFJV1iHnk0OrHfRTlHa8agSS7+EjRx0BmTVbDo/pcM4O5gbEkRwC/tdfEmsVNb
 xFKRVtWT8duL5V1nJsMuQEGDF8xe5VI=
X-Proofpoint-ORIG-GUID: P98wgQ5V0nMeV80WNySJqTbKwt3Iavx0
X-Proofpoint-GUID: P98wgQ5V0nMeV80WNySJqTbKwt3Iavx0
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6ae2fe88 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=6KvQjkKwYJz4M-1xzI4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290031

On 10/28/26 9:37 PM, Gergo Koteles wrote:
> Add the required node for haptic playback (Awinic AW86224).
> 
> Signed-off-by: Gergo Koteles <soyer@irl.hu>
> ---
> Changes in v2:
>  - rebased on mainline (Krzysztof)
>  - order by address (Konrad)
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
