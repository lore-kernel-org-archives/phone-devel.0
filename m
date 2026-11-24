Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795499889;
	b=NukZvQ8ratS6NE41gq1JKaXA8VtshtABSdrwjn7LY6LeR8X3mAH8ay3XKnlxGiWF1Wg/
	 wdYSw/h6BYga+/GdwjZJBLhEuRSpntDbtsqVlPy0BcqXSay1Fw2XfJcGi2VsmipPa8tIH
	 zy4LeDXqyIhBVRcxZHErXOQwcMLEOwyNaurJ7yW/Cl/863c5+8VqxcoCPjAYo5poxCrnm
	 7KgrFIGiLO6wLo613IHWON037J8MBKmUFsg4gOK6zheMyLh1D0W2BLIM84oiR9Yq62ixM
	 QNOOkSed7dxx8alZt0Fv2Mn7H5XFvUOCoQ90kjRlxLMDjLCBHYdXKAy5SHixx3izXpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795499889;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dqYw6HYYmdvUZfrzHDq22JpmOgPy72kyurBTcVtqHgE=;
	b=p7N2L0ZcnZ/0zYJCL1My3NkH3wymyr7MRo0aAfky7VB8nirWGyHvmoAF824usNm7Vi9o
	 i5GAL+aQ9bzkEKfc+m0bzNb1paSI3vkvlrxucW00WjDNG1/veIVDXY0AZk/1/OKP1AiLp
	 2kcdxYAyKsMLsTJPIs1PMtCgsrkbbmaWeliTu7R2fePfGON9i/YgKi6+9ze14zIWmXngh
	 Bs3H4kzaf1pTWogEChRQuZir8UVafKFMlyWhRy9LugNFTKE+G62MlzCRHmXFnwoMUIjfZ
	 YClHfc9f5sppRzYhXiXheJsNuZ9zHs52b1ieUIvY5yhZOlp8LrF/FoQgp58qJx91PUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D7480KVP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JoEfKl0g;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FFB606A321
	for <phone-devel@vger.kernel.org>; Tue, 24 Nov 2026 05:58:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77FFB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D7480KVP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JoEfKl0g
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2k2Qc3701109
	for <phone-devel@vger.kernel.org>; Tue, 24 Nov 2026 05:58:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dqYw6HYYmdvUZfrzHDq22Jpm
	OgPy72kyurBTcVtqHgE=; b=D7480KVPS5tuJwMx7EojDR4apivGB8bslLJZuJNG
	/lUoZ6Ol7OyPqyImaTjJne7hO7yGFjnefw3FrdhnsPXEpmcovEhPLkshUbLkc8XJ
	PUYO6fZtbIPQ2z71kuQ+dhBlll5kqblFda3HJDtAiamZjnzkXYLwKGcOgIXTN0if
	KgW4svsAOQsjU/udeok+pfpg5mpwYjRLN1aA3kMwvs5/YpqsDhWpW1umslw4xqKZ
	snIGTZ/FfEmMkjpgNxpztNYRh3xyxlVdkOgnGbRpNNdcCpjbBCsIrw39TEVENKJs
	f5KS595pczR+YI/fPrjwjJhVes4I9k8Dy4nETgF2eX7wkQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j50ky0xpv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 24 Nov 2026 05:58:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94960bd17b5so686377785a.0
        for <phone-devel@vger.kernel.org>; Mon, 23 Nov 2026 21:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795499886; x=1796104686; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dqYw6HYYmdvUZfrzHDq22JpmOgPy72kyurBTcVtqHgE=;
        b=JoEfKl0go0I+47cIwedBqM02IEhdAf7qhHqJiePv7yQm2e2Qpnam/3cSYdtBvO9pLa
         9muhAdefGwWxDpN54zkHuUwepjXKUbUKUVkN7zWO9sy8LbmF2nJbfujvXwdBRr971gZ5
         2KiMtavbmS1NIWUNEgH1O27LUBScLX0BCxzr1cmdGoyYN3Y5Di3z0NHPoE/hWo1SAfYN
         9vG+nwubvBG/eqYmrRw6At2o+IhTe5xq2oT66h1nxBHX+K+4vs4Mb+G3oGJr4S6zZSli
         UO27rzWNuBa69cMqh3/zGNCl6Gwb3ZTvbXfjejRbA9dV85kkCKdux4mM1yPtTQ8J1N9Z
         5qXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795499887; x=1796104687;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dqYw6HYYmdvUZfrzHDq22JpmOgPy72kyurBTcVtqHgE=;
        b=UALv4RSybBTAjtJJo+jdNlNmpC8Vip9mrr3KWBfckDzpMCzr9bmi1CUfsqE8dOGW8L
         iF+J1hIBi+cJUCbqTIVa/6Fj/xkGa7abTdFmh2d9iSbAD3Sy66cce9Fhjfp+TzHUZrvN
         5qg4YqiX0I+ucR/+ba9IfcJzJt2yEjI8wNVwKmaAZ+LdVAp2UXWwj4CGBxpA0iqrJSlM
         aLiPaJYtNFNyjVHNbVzwDCutmb2YOR/u9ZH12bcpONophEpfFuMqucok1H5Pf6msX0bo
         zE0HMzFCW8LDzFWpeMHaVpE5STL8Flvsl951sNzU59Bpn/Dgz2ojSXMyiwfs4cjSuX7k
         buXA==
X-Forwarded-Encrypted: i=1; AL+hErGEwUKoDmXAQD3f2bw8pKYF5wfI/dyWjAVYaTVTNU7cVkxszhOUvCzwYi5h8A9pfRzkwIhreZzOyAHvaw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8PPqZtRG6H3c4qglHzMJxMccL9mMiGdYKte1i4fiGUz4dxtQsI
	lkkvaKcEtAz3kBIIHo2cZbVufM8Wgeq81kUw+7h6KlX7DM8ezz4ZHo1Gczc8uyfxbbOeBEsZOh1
	XPv/0ggd/GqHkjtgYfaZPdWHREx/Awi8IriO3COD7br7W37P2u9acnqtlI8Wq2kgeTw==
X-Gm-Gg: AZFdTZfFkez/QVYs0/DeWxbhmD0nhMyKQKNf9JInT/DQ2mc2QkWKzCjVefCydGiuGvv
	c+zeqB0jg1pQLjHmTOoftPAlvHoCviGI6aETjIgiG7/FB7AfjbFveow0gLGJtAD8yHGk+A3vulw
	ZAA0VlkpbF5i6tgT9xt/iLWoyyvCHSEXBu5i8wfOfsTWsWPDXZpdtvMiB8GctuB2Jozz0DJ2FEE
	zEUmMtBJ5J2Mt3YNtCPgq+T8qR54lKNGKNO8tDL43CzF6yZZnBPBeUYsDPfHnRqXrXkLiaiST3R
	DVAWNE4WwsXuVtpU2ORHotLQyLlczLHGoXZ3cWkHOkrjNetjo9VRNxyUttozW1YmN0gY3iipr+Q
	/A8qmfA3024/M9AfrujOZ8QsoQBbIyGximCxqtdTH3YY4OLwOoEvqdZ89kAV1lvTr
X-Received: by 2002:a05:620a:4110:b0:939:b099:d52f with SMTP id af79cd13be357-949ba95dc6amr2330843985a.20.1795499886458;
        Mon, 23 Nov 2026 21:58:06 -0800 (PST)
X-Received: by 2002:a05:620a:4110:b0:939:b099:d52f with SMTP id af79cd13be357-949ba95dc6amr2330841185a.20.1795499885832;
        Mon, 23 Nov 2026 21:58:05 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm152892675e9.3.2026.11.23.21.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 21:58:04 -0800 (PST)
Date: Tue, 24 Nov 2026 07:58:02 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: sdm670-google: add sound card
Message-ID: <yi7wy6g2mi4xlys2afpi2kkxfbhwx6x3q7fcxdcgvkcjxmcvnf@6e2c323lcnbe>
References: <20261124015611.187024-1-mailingradian@gmail.com>
 <20261124015611.187024-6-mailingradian@gmail.com>
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
In-Reply-To: <20261124015611.187024-6-mailingradian@gmail.com>
X-Authority-Analysis: v=2.4 cv=Y+ptIReN c=1 sm=1 tr=0 ts=6b05276f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=FmVNMtDM8ubZ8rrqGTYA:9 a=CjuIK1q_8ugA:10
 a=zgiPjhLxNE0A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: rAylfGnzGavnvoASLHvUAOQocWLssWZB
X-Proofpoint-ORIG-GUID: rAylfGnzGavnvoASLHvUAOQocWLssWZB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyMyBTYWx0ZWRfX+e3cuLscxc9e
 DsbGga4fd3MYEAYHc7WgTN1XfucYtQTZ05vpEybDGWNIcnEGHxdL8PtdWuRyYxGzPXXU/y7F7de
 AQRADX+1EIAVSPKjWzRzd14DoE9jimE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyMyBTYWx0ZWRfXy4qPjJPnDx4n
 QDdWDFJVsigZ1KEnCKcKgDh7B4HIcjmpnVv9EaUbEgiXE2H7i98YUQDCUh1G0069P96zEWP3UMQ
 Ec8c9/b/NaX/CcB5uOoEJ3nlrZrRIfIb5AgH0Z7l4Rm7mEGD9Y39w2dpQH6oTcS4dxJHvYhFSXg
 wJ4iNHey7svyxF2Ww1DXTHXPjtw7sbMIY/A4xDd118ZjmyoZ8uWzCTAlu7emweyKea2duiEIGIe
 8xFolGFFszwPfbf4Infk2jrJ2sKifFy9UDWqUXdYYxh4bHKt4UzZdLV/5mhD4xXrHSwQWR5fvnw
 BPdREC6zHkHJ89cAT448nYR3iVS/pzQZWSKjx/V23FEIEYnDxvXbh6wXOy307gVbKnJ6xyijgBw
 uUg08IKskNx3riZC5Cw22SD2OVmvvN5uXwldhzzsJS8E2vS/OKZUVczByChn9/1+80n4lul2RD7
 SSX0/J7e3jMFvqtfTaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240023

On 26-11-23 20:56:11, Richard Acayan wrote:
> The Pixel 3a has a sound card for built-in audio (RT5514 and CS35L36
> codecs) and for the headphone jack (WCD codec). Add the sound card,
> q6asm frontends, and WCD codec for headset audio.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
